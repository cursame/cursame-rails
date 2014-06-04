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

  # POST /members_in_courses
  # POST /members_in_courses.json
  def create
    @members_in_course = MembersInCourse.new(params[:members_in_course])
    @course = @members_in_course.course_id
    @course_find = Course.find(@course)
    respond_to do |format|
      if @members_in_course.save!
        # Mail de notificación de un nuevo usuario.

        # activity
        @az = @members_in_course
        @typed = @members_in_course.class.to_s
        activation_activity

        if (!@members_in_course.owner and @course_find.public_status == "Private") then
          mail = Notifier.new_member_in_course(@course_find, @members_in_course.user)
          mail.deliver
        end
        format.js
        format.json
      else
       format.js
       format.json
      end
    end
  end

  # PUT /members_in_courses/1
  # PUT /members_in_courses/1.json
  def update
    @id = params[:id_member]
    @members_in_course = MembersInCourse.find(@id)
      c = params[:checked]
      t = params[:type_update]
      @member_it = User.find_by_id(params[:member_it])
      case
        when t == 'acceptin' 
             case 
               when c == 'checked'
                 @members_in_course.accepted = true
               when c == 'undefined'
                 @members_in_course.accepted = false
                 @members_in_course.owner = false

              end
        when t == 'ownerin' 
              case 
               when c == 'checked'
                 @members_in_course.owner = true
               when c == 'undefined'
                 @members_in_course.owner = false
              end
      end

      @members_in_course.save

    respond_to do |format|
      format.js
    end

    begin
      permissioning = Permissioning.find_by_user_id_and_network_id(@members_in_course.user.id, current_network.id)
      mixpanel_properties = { 
        'Network' => @members_in_course.course.network.name.capitalize,
        'Title'   => @members_in_course.course.title.capitalize,
        'Type'    => @members_in_course.course.public_status.capitalize,
        'Role'    => permissioning.role.title.capitalize
      }
      MixpanelTrackerWorker.perform_async @members_in_course.user.id, 'Members in Courses', mixpanel_properties
    rescue
      puts "\e[1;31m[ERROR]\e[0m error sending data to mixpanel"
    end

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
end
