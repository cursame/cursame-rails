# coding: utf-8

module CoursesUtils

  def teacher_published_courses
    current_user.courses.where(:network_id => current_network.id, :id => operator_courses('teacher') ,:active_status => true)
  end

  def teacher_unpublished_courses
    current_user.courses.keep_if do |course| 
      course.owner?(Role.find_by_title("teacher"), current_user) and not(course.active_status)
    end
  end
  
  def student_subscribed_courses
    current_user.courses.where(:network_id => current_network.id, :id => operator_courses('student') , :active_status => true)
  end

  def student_closed_courses
    current_user.courses.where(:network_id => current_network.id, :id => operator_courses('student') , :active_status => false)
  end
  
  def student_pending_requests
    members_in_courses = MembersInCourse.where(user_id: current_user.id).where("members_in_courses.accepted != ?", true)
    members_in_courses = members_in_courses.keep_if do |member| 
      member.course.network_id == current_network.id
    end
    members_in_courses.map{ |member| member.course}
  end

  def network_courses_not_subscribed
    Course.where(:network_id => current_network.id, :id => operator_courses('inverse') ,:active_status => true)
  end

  def operator_courses(typed = 'normal')
    ids = Array.new

    case typed 
    when 'inverse'
      courses_ids = current_user.members_in_courses.map {|member| member.course_id}
      ids = current_network.courses.map{|course| course.id} - courses_ids
      
    when 'normal'
      ids = current_user.courses.map {|course| course.id}
      
    when 'student'
      members = current_user.members_in_courses.keep_if { |member| member.accepted }
      ids = members.map { |member| member.course_id }
      
    when 'teacher'
      courses = current_user.courses.keep_if { |course| course.owner?(Role.find_by_title("teacher"), current_user) }
      ids = courses.map { |course| course.id }
    end

    ids
  end

  def course_member?(user, course)
    member = MembersInCourse.find_by_user_id_and_course_id(user.id, course.id)
    unless member.nil?
      unless member.accepted 
        redirect_to(root_path, flash: { error: "Necesitas ser aceptado en el curso para poder ver su contenido."}) and return
      end
    else
      redirect_to(root_path, flash: { error: "No estas inscrito en el curso, inscribete en la sección Cursos."}) and return
    end

    return true
  end

  def course_exist?(course)
    return redirect_to root_path, flash: { error: "El curso que estas intentando ver no existe o fue borrado."} if course.nil?
  end

  def user_is_owner?(course, user, role)
    redirect_to root_path, flash: { error: "Estas tratando de editar un curso que no te pertenece."} and return unless course.owner?(role, user)
  end

end
