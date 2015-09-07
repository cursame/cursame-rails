class SuperadminPanel::UsersController < SuperadminPanel::BaseController
  def index
    @users = User.includes(permissionings: [:network, :role])
             .order(:email).paginate(page: params[:page], per_page: 30)
  end

  def new
    @roles_options = Role.all.map { |role| [ I18n.t("roles.#{role.title}"), role.id] }
    @user = User.new
  end

  def create
    set_params(nil)
  end

  def edit
    @roles_options = Role.all.map { |role| [ I18n.t("roles.#{role.title}"), role.id] }
    @user = User.includes(permissionings: [:network, :role]).find_by_id params[:id]
  end

  def update
    set_params(params[:id])
  end

  def show
    @user = User.includes(permissionings: [:network, :role]).find_by_id params[:id]
  end

  def destroy
    user = User.find_by_id params[:id]
    user.destroy

    redirect_to superadmin_panel_users_path
  end

  private

  def set_params(id)
    params[:user][:subdomain] = params[:user_network_subdomain]
    params[:user][:domain] = request.domain

    params[:user][:personal_url] = SecureRandom.uuid if !id

    if id
      user = User.find_by_id id
    else
      user = User.new params[:user]
    end

    network = Network.find_by_subdomain(params[:user_network_subdomain])

    if !id && !user.save
      redirect_to superadmin_panel_users_path, flash: { error: 'error' }
    end

    if id && !user.update_attributes(params[:user])
      redirect_to superadmin_panel_users_path, flash: { error: 'error' }
    end

    permissioning = Permissioning.new(role_id: params[:user_role_id],
                                      network_id: network.id, user_id: user.id)

    if Role.find_by_id(params[:user_role_id]).title == "mentor_link" &&
       user.subdomain == "meems"

      permissioning.entity_id = params[:user_entity_id]
      permissioning.entity_name = params[:user_entity_name]
    end

    if permissioning.save
      if id
        permissionings = user.permissionings.delete_if do |permissioning|
          permissioning.role_id == params[:user_role_id] &&
            permissioning.network_id == network.id
        end
        permissionings.each { |permissioning| permissioning.destroy }
      end

      redirect_to superadmin_panel_user_path(user), flash: { success: 'success' }
    else
      redirect_to superadmin_panel_users_path, flash: { error: 'error' }
    end
  end
end
