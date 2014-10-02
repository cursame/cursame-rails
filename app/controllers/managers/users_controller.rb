# encoding: UTF-8
class Managers::UsersController < Managers::BaseController

  def index
    @users = current_network.users.search(params[:search]).paginate(:per_page => 50, :page => params[:page]).order('users.first_name')
  end

  def show
    @user = User.find_by_id params[:id]
  end

  def new
    @user = User.new
  end

  def create
    params[:user][:subdomain] = current_network.subdomain
    params[:user][:domain] = request.domain
    params[:user][:personal_url] = SecureRandom.uuid
    user = User.new params[:user]
    redirect_to managers_users_path, flash: user.save ? { success: 'Usuario creado correctamente.' } : { error: 'Ocurrio un error al crear el usuario' }
  end

  def edit
    @user = User.find_by_id params[:id]
  end

  def update
    user = User.find_by_id params[:user][:id]
    user.update_attributes params[:user] if !user.nil? && user.permissionings.first.network == current_network
    redirect_to managers_users_path, flash: User.exists?(user) ? { error: 'Error al borrar el usuario' } : { success: 'Usuario borrado correctamente' }
  end

  def destroy
    user = User.find_by_id params[:id]
    user.destroy if !user.nil? && user.permissionings.first.network == current_network && user != current_user
    redirect_to managers_users_path, flash: User.exists?(user) ? { error: 'Error al borrar el usuario' } : { success: 'Usuario borrado correctamente' }
  end

  def import
    @users = current_network.users
  end

  def import_receiver
    logger.info "content_type: #{params[:file].content_type}"
    if params[:file].content_type == "text/csv"
      UserCsvWorker.perform_async(params[:file].path, current_network.subdomain, current_user.email)
      redirect_to managers_users_path, flash: { success: 'Tu archivo esta siendo procesado, recibiras un correo electrónico de confirmación' }
    else
      redirect_to managers_users_path, flash: { error: 'Tipo de archivo no soportado' }
    end
  end

end