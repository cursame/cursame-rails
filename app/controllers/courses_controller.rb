class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  before_filter :filter_protection, :only => [:show, :edit, :crate, :update, :destoy, :members]
  def index
    @courses = Course.all
    ##### creamos el registro de los usuarios de un curso ######
    @member = MembersInCourse.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
    
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @member = MembersInCourse.find_by_course_id_and_user_id(@course.id,current_user.id)
    if @member.accepted
       respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @course }
        end
    else
       redirect_to courses_path, :notice => "no has sido aceptado en este curso"
    end
   
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        
           @member = MembersInCourse.new
             @member.user_id = current_user.id
             @member.course_id =  @course.id
             @member.accepted = true
             @member.owner = true
             @member.save
             
        format.json { render json: @course, status: :created, location: @course }
        format.js
      else
        format.json { render json: @course.errors, status: :unprocessable_entity }
        format.js
        
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
  
  def members
    @course = Course.find(params[:id])
    @course_member = MembersInCourse.find_by_course_id(@course.id)
  end
  
  def filter_protection
     @course = Course.find(params[:id])
     @member = MembersInCourse.find_by_course_id_and_user_id(@course.id,current_user.id)
     if @member.accepted
        respond_to do |format|
           format.html # show.html.erb
           format.json { render json: @course }
         end
     else
        redirect_to courses_path, :notice => "no has sido aceptado en este curso"
     end
  end
  
     
end
