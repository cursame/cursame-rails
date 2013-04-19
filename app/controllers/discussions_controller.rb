class DiscussionsController < ApplicationController
  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discussions }
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

      courses.each do |course|
        @discussion = Discussion.new(params[:discussion])
        @discussion.user = current_user
        @discussion.network = current_network
        @discussion.courses = [Course.find_by_id(course)]


        if @discussion.save then

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
      #    format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
      #    format.json { render json: @discussion, status: :created, location: @discussion }
      # else
      # format.html { render action: "new" }
      #   format.json { render json: @discussion.errors, status: :unprocessable_entity }

    end
  end

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { head :no_content }
      else
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
