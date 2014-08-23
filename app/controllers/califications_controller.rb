# coding: utf-8

class CalificationsController < ApplicationController
  def index
    if current_user.student?
      @courses = MembersInCourse.where(user_id: current_user.id, accepted: true).map { |member_in_course| member_in_course.course }
    else
      @courses = (current_user.teacher?) ? current_user.courses : current_network.courses
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