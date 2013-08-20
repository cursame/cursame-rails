class ManagersController < ApplicationController
  filter_access_to :all

  def wall
    ##### for users bar
    @member = current_network.permissionings
    @member_count = @member.count
    @network_population = current_network.population
    @diision =  @member.count
    @porcent_of_students =   ((@diision* 100)/ @network_population).to_i
    # @network_users = User.where(:network => current_network)




    #### for courses counters
    @courses = current_network.courses
    @public_courses = @courses.where(:public_status => 'public')
    @publico = @public_courses.count
    @private_courses = @courses.where(:public_status => 'Private')
    @privado =  @private_courses.count

    #### deliveries for courses

    @deliveries = current_network.deliveries
    @total_deliveries =  @deliveries.count
    @open_deliveries =  @deliveries.where(:state => 'published')
    @close_deliveries =  @deliveries.where(:state => 'unpublish')
    @published_deliveries_count =  @open_deliveries.count
    @unpublished_deliveries_count =  @close_deliveries.count


  end

  def members
    @users = current_network.users.search(params[:search]).paginate(:per_page => 50, :page => params[:page]).order('users.first_name')
  end

  def network_configuration
    @network= current_network
  end

  def library

   # @libraries = current_network.libraries
  # @library = Library.new(params[:id])
  
  redirect_to '/managers/wall'

  end

  def import_users
    @users = current_network.users
  end

  def upload_users

    network = current_network
    user_admin = current_user

    user_info = User.find_by_email("info@cursa.me")

    lastFile = Dir.glob("public/imports/import_users_*").sort.last
    if lastFile.nil? then
      name = "import_users_1.csv"
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

      user_info.delay.import(path,network,user_admin)

    rescue
      @noFile = true
    end
    @users = current_network.users
    respond_to do |format|
      format.html { render "managers/import_users"}
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

  def send_mails
    @user = current_user

  end

  def sending
    users = User.all
    users.each do |user|
      mail = Notifier.send_email(user,params[:subject],params[:message])
      mail.deliver
    end
    redirect_to managers_wall_path
  end

  #GET /managers/import
  def import_courses
    @courses = current_network.courses
  end

  #POST /managers/upload_csv
  def upload_courses

    network = current_network
    user_admin = current_user

    if Course.find_by_title_and_silabus("1","1").nil? then
      course = Course.new(:title => "1", :silabus => "1")
      course.save!
    else
      course = Course.find_by_title_and_silabus("1","1")
    end


    lastFile = Dir.glob("public/imports/import_courses_*").sort.last
    if lastFile.nil? then
      name = "import_courses_1.csv"
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

      course.delay.import(path,network,user_admin)
    rescue
      @noFile = true
    end

    @courses = network.courses
    respond_to do |format|
      format.html { render "/managers/import_courses"}
      format.json { render json: @courses }
    end
  end

  def send_usuarios
    send_file "assets/plantillas/usuarios_plantilla.csv"
    redirect_to :managers_import_users_path
  end
end
