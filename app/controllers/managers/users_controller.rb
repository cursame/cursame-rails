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

  def import
  @users = current_network.users
  end
end