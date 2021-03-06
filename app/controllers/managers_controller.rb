class ManagersController < ApplicationController
  filter_access_to :all
  skip_before_filter :filter_access_filter, :only => :upload_users_a
  layout 'managers'

  def index
    @member = current_network.permissionings
    @member_count = @member.count
    @network_population = current_network.population
    @diision =  @member.count
    @porcent_of_students =   ((@diision* 100)/ @network_population).to_i
    @courses = current_network.courses
    @deliveries = current_network.deliveries
    @total_deliveries =  @deliveries.count
    @open_deliveries =  @deliveries.where(:state => 'published')
    @close_deliveries =  @deliveries.where(:state => 'unpublish')
    @published_deliveries_count =  @open_deliveries.count
    @unpublished_deliveries_count =  @close_deliveries.count
    @counter_students = current_network.permissionings.where(:role_id => 2).count
    @counter_teachers = current_network.permissionings.where(:role_id => 3).count
    @counter_admins = current_network.permissionings.where(:role_id => 1).count

    if current_network.subdomain == "meems"
      operators = current_network.permissionings.where(:role_id => Role.operator.id)
      @counter_operators = operators.count
      mentors_link = current_network.permissionings.where(:role_id => Role.mentor_link.id)
      @counter_mentors_link = mentors_link.count
    end
  end

  def publications
    respond_to do |format|
      format.html { render 'managers/publications/index' }
    end
  end

  def mailer
    @user = current_user
  end

  def mailer_deliver
    case params[:users]
      when 'only_teachers'
        users = current_network.users.keep_if { |user| user.teacher? }
      when 'only_students'
        users = current_network.users.keep_if { |user| user.student? }
      else
        users = current_network.users
    end
    confirmed_users = confirmed_users(users)
    current_network.send_email(current_user, confirmed_users, params[:subject], params[:message]) if confirmed_users.size > 0
    redirect_to managers_mailer_path, flash: { success: t('.managers_controller.in_stack') }
  end

  def network_mailer_user_list
    @id = 'users-search-input'
  end

  def network_mailer_student_list
    @id = 'students-search-input'
  end

  def network_mailer_teacher_list
    @id = 'teachers-search-input'
  end

  def network_mailer_list_deliver
    users_id = params[:users].map { |key, value| key }
    users = users_id.map { |id| User.find_by_id id }
    confirmed_users = confirmed_users(users)
    current_network.send_email(current_user, confirmed_users, params[:subject], params[:message]) if confirmed_users.size > 0
    redirect_to managers_mailer_path, flash: { success: t('.managers_controller.in_stack') }
  end

  def course_mailer
    @course = Course.find_by_id(params[:course])
  end

  def course_mailer_deliver
    course = Course.find_by_id(params[:course_id])
    case params[:users]
      when 'only_teachers'
        course_members = course.users.keep_if { |user| user.teacher? }
      when 'only_students'
        course_members = course.users.keep_if { |user| user.student? }
      else
        course_members = course.users
    end
    confirmed_users = confirmed_users(course_members)
    current_network.send_email(current_user, confirmed_users, params[:subject], params[:message]) if confirmed_users.size > 0
    redirect_to managers_courses_path, flash: { success: t('.managers_controller.in_stack') }
  end

  def course_mailer_list
    @course = Course.find_by_id(params[:course_id])
  end

  def course_mailer_list_deliver
    course_users_id = params[:users]
    course_users = course_users_id.map { |id| User.find_by_id(id) }
    confirmed_users = confirmed_users(course_users)
    current_network.send_email(current_user, confirmed_users, params[:subject], params[:message]) if confirmed_users.size > 0
    redirect_to managers_courses_path, flash: { success: t('.managers_controller.in_stack') }
  end

  def settings
    @network = current_network
    @network.build_bit_setting if @network.bit_setting.nil?
  end

  def upload_users_a

    user_info = User.find_by_email("info@cursa.me")
    network = params[:red]
    user_admin = user_info

    lastFile = Dir.glob("public/imports/import_users_*")
    lastFile = lastFile.sort.map{|x| x.gsub(/[^0-9]/, '')}.map{|x| x.to_i}.sort.last
    if lastFile.nil? then
      name = "import_users_1.csv"
    else
      name = "import_users_" + lastFile.succ.to_s + ".csv"
    end

    text = ""
    begin
      File.open(params[:file].path,"r:ISO-8859-1").each do |line|
        text += line
      end

      path = "public/imports/" + name
      f = File.open(path,'w+')
      f.write(text)
      f.close

      domain = params["domain"]
      subdomain = network.subdomain

      user_info.delay.import(path,network,user_info,domain,subdomain)
    #user_info.import(path,network,user_admin,domain,subdomain)

    rescue
      @noFile = true
    end
    @users = current_network.users
    respond_to do |format|
      format.html redirect_to :back
      format.json { render json: @users }
    end
  end

  def upload_members
    courses = params[:courses]
    network = current_network
    user_admin = current_user
    @courses = network.courses

    if Course.find_by_title_and_silabus("1","1").nil? then
      course_empty = Course.new(:title => "1", :silabus => "1")
      course.save!
    else
      course_empty = Course.find_by_title_and_silabus("1","1")
    end

    user_info = User.find_by_email("info@cursa.me")

    if MembersInCourse.find_by_user_id_and_course_id(1,course_empty.id).nil? then
      members_in_course_empty = MembersInCourse.new(:user_id => user_info.id, :course_id => course_empty.id)
      members_in_course_empty.save!
    else
      members_in_course_empty = MembersInCourse.find_by_user_id_and_course_id(1,course_empty.id)
    end

    if !courses.nil? then
      courses.each do
        |course_id|

        lastFile = Dir.glob("public/imports/import_members_*").sort.last
        if lastFile.nil? then
          name = "import_members_1.csv"
        else
          lastFile = lastFile.split("/").last
          nameFile = lastFile[0...-4]
          name = nameFile.succ + ".csv"
        end

        text = ""
        begin
          File.open(params[:file].path,'r').each do |line|
            text += line
          end

          path = "public/imports/" + name
          f = File.open(path,'w+')
          f.write(text)
          f.close

        rescue
          @noFile = true
        end

        course = Course.find_by_id(course_id)
        members_in_course_empty.delay.import(path,network,course,user_admin)
      end
    end

      respond_to  do |format|
        format.html { render "managers/import_members"}
        format.json { render json: @courses}
      end
    end

  def import_members
    @courses = current_network.courses
  end

  def send_usuarios
    send_file "assets/plantillas/usuarios_plantilla.csv"
    redirect_to :managers_import_users_path
  end

  private

  def confirmed_users(users)
    users.keep_if { |user| user.confirmed? }
  end

end
