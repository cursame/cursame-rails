class SuperadminPanel::UsersController < SuperadminPanel::BaseController
  def index
    @users = User.includes(permissionings: [:network, :role])
             .order(:email).paginate(page: params[:page], per_page: 30)
  end

  def show
    @user = User.includes(permissionings: [:network, :role]).find_by_id params[:id]
  end
end
