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
  end

  def network_configuration
    @network= current_network
  end

  def library

    @libraries = current_network.libraries
    @library = Library.new(params[:id])

  end

  def import_users
    #superadmin = current_user.roles.keep_if {
    #  |role|
    #  role.id == 4 || role.id == 1
    #}
    #if superadmin.size < 1 then
    #  redirect_to root_path
    #end
    @users = User.all
  end

  def upload_users
    #superadmin = current_user.roles.keep_if {
    #  |role|
    #  role.id ==4 || role.id == 1
    #}
    #if superadmin.size < 1 then
    #  redirect_to root_path
    #end
    @errores = User.import(params[:file])
    @users = User.all
    respond_to do |format|
      format.html { render "managers/import_users"}
      format.json { render json: @users }
    end
  end

  def send_mails
    @user = current_user
    superadmin = @user.roles.keep_if {
      |role|
      role.id == 4 || role.id == 1
    }

    if superadmin.size < 1 then
      redirect_to root_path
    end
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
    superadmin = current_user.roles.keep_if {
      |role|
      role.id == 4 || role.id == 1
    }
    if superadmin.size < 1 then
      redirect_to root_path
    end

    @courses = Course.all
  end

  #POST /managers/upload_csv
  def upload_courses
    superadmin = current_user.roles.keep_if {
      |role|
      role.id == 4 || role.id == 1
    }
    if superadmin.size < 1 then
      redirect_to root_path
    end

    @errores = Course.import(params[:file])
    @courses = Course.all
    respond_to do |format|
      format.html { render "/managers/import_courses"}
      format.json { render json: @courses }
    end
  end
end
