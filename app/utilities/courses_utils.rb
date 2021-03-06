# coding: utf-8

module CoursesUtils

  def published_courses
    if current_user.mentor_link?

      entity_id = current_user.permissionings.first.entity_id
      entity_name = current_user.permissionings.first.entity_name
      Course.includes(:school)
        .where(
          network_id: current_network.id,
          active_status: true,
          schools: { entity_id: entity_id, entity_name: entity_name }
        ).order(:title)
    else
      current_network.courses.where(active_status: true).order(:title)
    end
  end

  def unpublished_courses
    current_network.courses.where(active_status: false).order(:title)
  end

  def teacher_published_courses
    current_user.courses
      .where(
        :network_id => current_network.id,
        :id => operator_courses('teacher'),
        :active_status => true
      ).order(:title)
  end

  def teacher_unpublished_courses
    current_user.courses
      .where(
        :network_id => current_network.id,
        :id => operator_courses('teacher'),
        :active_status => false
      ).order(:title)
  end

  def student_subscribed_courses
    current_user.courses
      .where(
        :network_id => current_network.id,
        :id => operator_courses('student'),
        :active_status => true
      ).order(:title)
  end

  def student_closed_courses
    current_user.courses
      .where(
        :network_id => current_network.id,
        :id => operator_courses('student'),
        :active_status => false
      ).order(:title)
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
    if member.nil?
      redirect_to(root_path, flash: { error: t('.courses_controller.no_register')}) and return
    end

    return true
  end

  def course_exist?(course)
    redirect_to(root_path, flash: { error: "El curso que estas intentando ver no existe o fue borrado."}) and return if course.nil?
  end

  def user_is_owner?(course, user, role)
    redirect_to root_path, flash: { error: "Estas tratando de editar un curso que no te pertenece."} and return unless course.owner?(role, user)
  end

end
