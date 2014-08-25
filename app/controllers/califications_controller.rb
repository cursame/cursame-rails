# coding: utf-8

class CalificationsController < ApplicationController
  include CoursesUtils

  def index
    if current_user.student?
      @courses = student_subscribed_courses
    else
      @courses = (current_user.teacher?) ? teacher_published_courses : current_network.courses
    end
  end

  def closed
    if current_user.student?
      @courses = student_closed_courses
    else
      @courses = teacher_unpublished_courses
    end
  end

  # TODO: Agregar validacion si es teacher que no pueda ver los que son de el, y si es student que sea un curso donde este inscrito
  def course
    @course = Course.find_by_id params[:id]
  end

  # TODO: Agregar validacion que si es teacher, solo lo pueda ve si es dueño, el admin ve todo
  def member
    @course = Course.find_by_id params[:course_id]
    @member = MembersInCourse.find_by_id params[:member_id]
  end
end