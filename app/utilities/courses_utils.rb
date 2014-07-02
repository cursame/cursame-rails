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
    current_user.courses.where(:network_id => current_network.id, :id => operator_courses('student') ,:active_status => true)
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
end
