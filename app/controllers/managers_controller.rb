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
    @public_courses = @courses.where(:public_status => 'public')
    @publico = @public_courses.count
    @private_courses = @courses.where(:public_status => 'Private')
    @privado =  @private_courses.count
    @deliveries = current_network.deliveries
    @total_deliveries =  @deliveries.count
    @open_deliveries =  @deliveries.where(:state => 'published')
    @close_deliveries =  @deliveries.where(:state => 'unpublish')
    @published_deliveries_count =  @open_deliveries.count
    @unpublished_deliveries_count =  @close_deliveries.count
  end

  def mailer
    @user = current_user
  end

  def mailer_deliver
    users = current_network.users
    if !users.nil? then
      if users.size != 0 then
        current_network.delay.send_email(current_user,users,params[:subject],params[:message])
      end
    end
    redirect_to managers_mailer_path, flash: { success: 'Su correo se ha puesto en cola para enviar.' }
  end

  def settings
    @network= current_network
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
  
end
