# coding: utf-8

class DiscussionsController < ApplicationController
  include CoursesUtils
  include DiscussionsUtils
  before_filter :validations, only: :show

  def index
    discussions = student_discussions.paginate(per_page: CARDS_PER_PAGE, page: 1)
    @discussions = discussions.keep_if {|discussion| discussion.publish_date < DateTime.now}
  end

  def discussions_course
    @course = Course.find_by_id(params[:id])
    member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, @course)

    unless member.nil?
      redirect_to root_path, flash: { error: t('.discussions_controller.no_accepted')} unless member.accepted
    else
      redirect_to root_path, flash: { error: t('.discussions_controller.no_register')}
    end

    discussions = course_discussions(@course).paginate(per_page: CARDS_PER_PAGE, page: 1)
    @discussions = discussions.keep_if {|discussion| discussion.publish_date < DateTime.now}
  end

  def paginate_ajax
    page = params[:page]
    @type = params[:type]
    @next_page = page.to_i + 1

    case @type
    when 'all'
      @course = nil
      discussions_raw = student_discussions
    when 'course'
      @course = Course.find_by_id(params[:course])
      discussions_raw = course_discussions(@course)
    end

    @discussions = discussions_raw.paginate(per_page: CARDS_PER_PAGE, page: page)

    respond_to do |format|
      format.js { render 'discussions/ajax/discussions_paginate_ajax' }
    end
  end

  def show
    @wall = Wall.find_by_publication_type_and_publication_id('Discussion', @discussion.id)
  end

  def new
    @discussion = Discussion.new
    permissioning = Permissioning.find_by_user_id_and_network_id(self.user_id, self.network.id)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion }
    end
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.json
  def createPast

    @publication = []

    if params[:delivery]
      courses = params[:delivery]["course_ids"]

      courses.each do |courseId|
        @discussion = Discussion.new(params[:discussion])
        @discussion.user = current_user
        @discussion.network = current_network
        @discussion.courses = [Course.find(courseId)]

        if params[:delivery][:evaluation_period_id]
          @discussion.evaluation_period_id = params[:delivery][:evaluation_period_id].first.to_i
        end


        if @discussion.save
          @publication.push(Wall.find_by_publication_type_and_publication_id("Discussion",@discussion.id))
          @az = @discussion
          @typed = "Discussion"
          activation_activity
        else
          @error_evaluation_period = true
        end
      end


    else
      @discussion = Discussion.new(params[:discussion])
      @discussion.user = current_user
      @discussion.network = current_network

      if @discussion.save then
        @publication.push(Wall.find_by_publication_type_and_publication_id("Discussion",@discussion.id))
        @az = @discussion
        @typed = "Discussion"
        activation_activity
      end
    end

    respond_to do |format|
      format.js
    end
  end

  def create
    @publication = []

    unless params[:delivery] == nil
      courses = params[:delivery]["course_ids"]
      @course = Course.find_by_id(courses[0])
      courses.each do |courseId|
        @discussion = Discussion.new(params[:discussion])
        @discussion.user = current_user
        @discussion.network = current_network
        @discussion.courses = [Course.find_by_id(courseId)]

        if params[:delivery][:evaluation_period_id]
          @discussion.evaluation_period_id = params[:delivery][:evaluation_period_id].first.to_i
        end

        if @discussion.save
          @publication.push(Wall.find_by_publication_type_and_publication_id("Discussion",@discussion.id))
          @az = @discussion
          @typed = "Discussion"
          activation_activity
        else
          @error_evaluation_period = true
        end
      end

    else
      @discussion = Discussion.new(params[:discussion])
      @discussion.user = current_user
      @discussion.network = current_network

      if @discussion.save
        @publication.push(Wall.find_by_publication_type_and_publication_id("Discussion",@discussion.id))
        @az = @discussion
        @typed = "Discussion"
        activation_activity
      else
        @error_evaluation_period = true
      end
    end

    if params[:files] && !@error_evaluation_period
      params[:files].each do |asset_id|
        @asset = Asset.find_by_id asset_id
        @discussion.assets.push @asset unless @asset.nil?
      end
    end

    respond_to do |format|
      format.js
    end
  end

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update
    @discussion = Discussion.find(params[:id])
    @wall_publication = Wall.find_by_publication_type_and_publication_id("Discussion",@discussion.id)

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        format.js
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.js
        format.html { render action: "edit" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to discussions_url }
      format.json { head :no_content }
    end
  end

  def validations
    @discussion = Discussion.find_by_id(params[:id])
    redirect_to root_path, flash: { error: t('.discussions_controller.delete')} and return if @discussion.nil?
    unless @discussion.courses.empty?
      course_member?(current_user, @discussion.courses.first)
    end
  end

  private
  def track_discussion(discussion)
    permissioning = Permissioning.find_by_user_id_and_network_id current_user.id, current_network.id
    unless discussion.courses.nil? || discussion.courses.empty?
      discussion.courses.each do |course|
        mixpanel_properties = {
          'Network' => current_network.name.capitalize,
          'Subdomain' => current_network.subdomain,
          'Course' => course.title.capitalize,
          'Role' => permissioning.role.title.capitalize,
          'Evaluable' => discussion.evaluable?
        }
      end
    else
      mixpanel_properties = {
        'Network' => current_network.name.capitalize,
        'Subdomain' => current_network.subdomain,
        'Course'  => 'Public',
        'Role'    => permissioning.role.title.capitalize,
        'Evaluable' => @discussion.evaluable?
      }
    end
    track_event current_user.id, 'Discussions', mixpanel_properties
  end

end
