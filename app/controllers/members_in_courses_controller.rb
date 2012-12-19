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

    respond_to do |format|
      if @members_in_course.save
        format.html { redirect_to :back, notice: 'Members in course was successfully created.' }
        format.json { render json: @members_in_course, status: :created, location: @members_in_course }
      else
        format.html { render action: "new" }
        format.json { render json: @members_in_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members_in_courses/1
  # PUT /members_in_courses/1.json
  def update
    @members_in_course = MembersInCourse.find(params[:id])

    respond_to do |format|
      if @members_in_course.update_attributes(params[:members_in_course])
        format.html { redirect_to @members_in_course, notice: 'Members in course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @members_in_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members_in_courses/1
  # DELETE /members_in_courses/1.json
  def destroy
    @members_in_course = MembersInCourse.find(params[:id])
    @members_in_course.destroy

    respond_to do |format|
      format.html { redirect_to members_in_courses_url }
      format.json { head :no_content }
    end
  end
end
