class DiscussionsController < ApplicationController
  include CoursesUtils

  def index
    wallTypeDiscussion = Wall.find_all_by_publication_type_and_public_and_network_id('Discussion',true,current_network.id)
    #wallTypeDiscussion = Wall.where publication_type: 'Discussion', public: true, network_id: current_network.id
    discussionsPublic = wallTypeDiscussion.map { |e| e.publication }

    courses = student_subscribed_courses

    discussionsCourse = courses.inject([]) do
      |accu, course|
      accu + course.discussions
    end

    discussions = discussionsPublic + discussionsCourse

    @discussions = discussions.sort do
      |x,y| y.created_at <=> x.created_at
    end

  end

  def discussions_course
    @course = Course.find_by_id(params[:id])

    member = MembersInCourse.find_by_user_id_and_course_id(current_user.id,params[:id])
    unless member.nil?
      redirect_to root_path, flash: { error: "Estas tratando de ver Discusiones de un curso donde no has sido aceptado."} unless member.accepted
    else
      redirect_to root_path, flash: { error: "Estas tratando de ver Discusiones de un curso donde no estas inscrito."}
    end

    discussions = @course.discussions

    @discussions = discussions.sort do
      |x,y| y.created_at <=> x.created_at
    end
  end

  def my_discussions
    @wall = current_network.walls.where(:publication_type => 'Discussion').paginate(:per_page => 5, :page => params[:page]).order('created_at DESC')

    respond_to do |format|
      if params[:fo_format].nil?
      format.html
      else
      format.js
      end
    end
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/new
  # GET /discussions/new.json
  def new
    @discussion = Discussion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/1/edit
  def edit
    @discussion = Discussion.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.json
  def create

    @publication = []

    if params[:delivery]
      courses = params[:delivery]["course_ids"]

      courses.each do |courseId|
        @discussion = Discussion.new(params[:discussion])
        @discussion.user = current_user
        @discussion.network = current_network
        @discussion.courses = [Course.find(courseId)]


        if @discussion.save! then
          @publication.push(Wall.find_by_publication_type_and_publication_id("Discussion",@discussion.id))
          @az = @discussion
          @typed = "Discussion"
          activation_activity
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

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update
    @discussion = Discussion.find(params[:id])
    @publication = Wall.find_by_publication_type_and_publication_id("Discussion",@discussion.id)
    
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
end
