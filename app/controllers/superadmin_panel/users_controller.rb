class SuperadminPanel::UsersController < SuperadminPanel::BaseController
  include ActiveModel::ForbiddenAttributesProtection

  def index
    @users = User.includes(permissionings: [:network, :role])

    search = params[:search] ? params[:search].strip.squeeze(' ').downcase : ''

    search_by_field(:email, search)
    search_by_field(:first_name, search)
    search_by_field(:last_name, search)

    @users = @users.paginate(page: params[:page], per_page: 30)
  end

  def new
    @user = User.new
    @user.permissionings.build
  end

  def create
    @user = User.new(users_params)
    @user.skip_confirmation!
    @user.domain = request.domain
    if @user.save
      redirect_to superadmin_panel_user_path(@user)
    else
      render action: :new
    end
  end

  def edit
    @user = User.includes(permissionings: [:network, :role]).find_by_id params[:id]
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.email != params[:user][:email]
      @user.skip_reconfirmation!
    end

    if @user.update_attributes(users_params)
      redirect_to superadmin_panel_user_path(@user)
    else
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

  def confirm
    user = User.find_by_id(params[:id])
    user.confirm!
    redirect_to superadmin_panel_user_path(user)
  end

  private

  def users_params
    params.require(:user).permit(:self_register, :accepted_terms, :first_name,
                                 :last_name, :email, :password, :subdomain,
                                 permissionings_attributes: [:role_id, :entity_name, :user_id,
                                                             :entity_id, :id])
  end

  def search_by_field(field, search)
    if params[field]
      @users = @users.where("LOWER(#{field.to_s}) LIKE ?", "%#{search}%")
    end
  end
end
