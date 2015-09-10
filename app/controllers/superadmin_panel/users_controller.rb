class SuperadminPanel::UsersController < SuperadminPanel::BaseController
  include ActiveModel::ForbiddenAttributesProtection

  def index
    @users = User.includes(permissionings: [:network, :role])
             .order(:email).paginate(page: params[:page], per_page: 30)
  end

  def new
    @roles_options = Role.all.map { |role| [ I18n.t("roles.#{role.title}"), role.id] }
    @user = User.new
    @user.permissionings.build
  end

  def create
    @user = User.new(users_params)

    network_id = params[:user][:permissionings_attributes][:"0"][:network_id]
    @user.subdomain = Network.find_by_id(network_id).subdomain
    @user.personal_url = SecureRandom.uuid
    @user.domain = request.domain
    if @user.save
      redirect_to superadmin_panel_user_path(@user)
    else
      Rails.logger.error @user.errors.inspect
      @roles_options = Role.all.map { |role| [ I18n.t("roles.#{role.title}"), role.id] }
      render action: :new
    end
  end

  def edit
    @roles_options = Role.all.map { |role| [ I18n.t("roles.#{role.title}"), role.id] }
    @user = User.includes(permissionings: [:network, :role]).find_by_id params[:id]
  end

  def update
    @user = User.find_by_id(params[:id])

    network_id = params[:user][:permissionings_attributes][:"0"][:network_id]
    @user.subdomain = Network.find_by_id(network_id).subdomain
    @user.domain = request.domain

    if @user.update_attributes(users_params)
      @user.permissionings.first.destroy
      redirect_to superadmin_panel_user_path(@user)
    else
      @roles_options = Role.all.map { |role| [ I18n.t("roles.#{role.title}"), role.id] }
      render action: :edit
    end
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

  def users_params
    params.require(:user).permit(:self_register, :accepted_terms, :first_name,
                                 :last_name, :email, :password,
                                 permissionings_attributes: [:network_id, :role_id,
                                                             :entity_name, :entity_id])
  end
end
