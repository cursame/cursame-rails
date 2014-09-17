class Managers::CoursesController < Managers::BaseController
  def index
    @courses = Course.where(:network_id => current_network.id)
  end

  def show
    @course = User.find_by_id params[:id]
  end

  def new
  end
end