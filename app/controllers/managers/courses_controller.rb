class Managers::CoursesController < Managers::BaseController
  def index
    @courses = Course.where(:network_id => current_network.id).paginate(per_page: MANAGERS_RECORDS_PER_PAGE, page: params[:page])
  end

  def show
    @course = Course.find_by_id params[:id]
  end

  def new
    @course = Course.new
  end

  def create
    course = Course.new(params[:course])
    course.network = current_network

    students = params[:students] || {}
    teachers = params[:teachers] || {}

    user_ids = students.merge(teachers).map{|key, value| key}
    course.members_in_courses = user_ids.map do |user_id|
      member = User.find_by_id user_id
      MembersInCourse.new(user: member, course: course, accepted: true, owner: member.student? ? false : true)
    end
    redirect_to managers_courses_path, flash: course.save ? { success: 'Curso creado correctamente' } : { success: 'Ocurrio un error al editar el curso' }
  end

  def edit
    @course = Course.find_by_id params[:id]
  end

  def update
    course = Course.find_by_id params[:id]
    course.assign_attributes params[:course] if !course.nil? && course.network == current_network

    students = params[:students] || {}
    teachers = params[:teachers] || {}

    user_ids = students.merge(teachers).map{|key, value| key}
    course.members_in_courses = user_ids.map do |user_id|
      member = User.find_by_id user_id
      MembersInCourse.new(user: member, course: course, accepted: true, owner: member.student? ? false : true)
    end
    redirect_to managers_courses_path, flash: course.save ? { success: 'Curso editado correctamente' } : { success: 'Ocurrio un error al editar el curso' }
  end

  def destroy
    course = Course.find_by_id(params[:id])
    course.destroy if !course.nil? && course.network == current_network
    redirect_to managers_courses_path, flash: Course.exists?(course) ? { error: 'Ocurrio un error al borrar el curso' } : { success: 'Curso borrado correctamente.' }
  end

end