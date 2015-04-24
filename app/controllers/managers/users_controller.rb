# encoding: UTF-8
class Managers::UsersController < Managers::BaseController

  def index
    @users = current_network.users.paginate(per_page: MANAGERS_RECORDS_PER_PAGE, page: params[:page])
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
    redirect_to managers_users_path, flash: user.save ? { success: t('.managers.create') } : { error: t('.managers.error_user') }
  end

  def edit
    @user = User.find_by_id params[:id]
    redirect_to root_path, flash: { error: t('.managers.no_edit') } unless current_user.superadmin? or (current_user.admin? and current_user.permissionings.first.network == @user.networks.last)
  end

  def update
    user = User.find_by_id params[:user][:permissionings_attributes][:'0'][:id]
    the_flash = { error: t('.managers.edit_error') }
    if !user.nil? && user.permissionings.first.network == current_network
      the_flash = { success: t('.managers.success_usr') } if user.update_attributes params[:user]
    end
    redirect_to managers_users_path, flash: the_flash
  end

  def destroy
    user = User.find_by_id params[:id]
    if current_user.superadmin? or (current_user.admin? and current_user.permissionings.first.network == user.networks.last)
      user.destroy if !user.nil? && user.permissionings.first.network == current_network && user != current_user
      redirect_to managers_users_path, flash: User.exists?(user) ? { error: t('.managers.error_delete_user') } : { success: t('.managers.delete_success_usr') } and return    
    end
    redirect_to root_path, flash: { error: t('.managers.no_delete') }
  end

  def import
    @users = current_network.users
  end

  def import_receiver
    logger.info "content_type: #{params[:file].content_type}"
    if ['text/csv', 'text/plain'].include?(params[:file].content_type)
      UserCsvWorker.perform_async(params[:file].path, current_network.subdomain, current_user.email)
      redirect_to(managers_users_path, flash: { success: t('.managers.proc_file') }) and return
    else
      redirect_to(managers_users_path, flash: { error: t('.managers.file') })
    end
  end

end