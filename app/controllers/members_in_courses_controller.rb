# -*- coding: utf-8 -*-
class MembersInCoursesController < ApplicationController
  # GET /members_in_courses
  # GET /members_in_courses.json
  def index
    @members_in_courses = MembersInCourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members_in_courses }
    end
  end

  # GET /members_in_courses/1
  # GET /members_in_courses/1.json
  def show
    @members_in_course = MembersInCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @members_in_course }
    end
  end

  # GET /members_in_courses/new
  # GET /members_in_courses/new.json
  def new
    @members_in_course = MembersInCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @members_in_course }
    end
  end

  # GET /members_in_courses/1/edit
  def edit
    @members_in_course = MembersInCourse.find(params[:id])
  end

  # DELETE /members_in_courses/1
  # DELETE /members_in_courses/1.json
  def destroy
    @members_in_course = MembersInCourse.find(params[:id])
    @course_id = @members_in_course.course_id
    @members_in_course.destroy
    @channel = Channel.find_by_channel_name("/messages/course_channel_#{@course_id}")

    respond_to do |format|
      format.js
      format.json
    end
  end

  def rate_course_user
    members_in_course = MembersInCourse.find_by_id params[:member_id]
    members_in_course.update_attributes params[:members_in_course]
    members_in_course.evaluate!
    # TODO: enviar correo al usuario
    Notification.create users: [members_in_course.user], notificator: members_in_course.grade, kind: 'course_grade'
    redirect_to closure_user_overview_path(params[:course_id], params[:member_id]), flash: { success: 'Alumno se ha calificado correctamente.' }
  end
end
