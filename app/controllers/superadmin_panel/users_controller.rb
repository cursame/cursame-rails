class SuperadminPanel::UsersController < SuperadminPanel::BaseController

  def index
    @users = User.includes(permissionings: [:network, :role]).
             order(:email).paginate(page: params[:page], per_page: 30)
  end
end
