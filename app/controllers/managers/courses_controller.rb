class Managers::CoursesController < Managers::BaseController
  def index
    @courses = Course.where(:network_id => current_network.id)
  end

  def show
    @course = Course.find_by_id params[:id]
  end

  def new
    @course = Course.new
  end

  def create
    redirect_to managers_courses_path, flash: { success: 'Curso creado correctamente.' }
  end

  def edit
    @course = Course.find_by_id params[:id]
  end

  def update
    redirect_to managers_courses_path, flash: { success: 'Curso editado correctamente.' }
  end

  def destroy
    redirect_to managers_courses_path, flash: { success: 'Curso borrado correctamente.' }
  end
end