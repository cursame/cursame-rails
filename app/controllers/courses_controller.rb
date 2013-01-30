class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  before_filter :filter_protection, :only => [:show, :edit, :destroy, :members]
  def index
    @courses = Course.search(params[:search])
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
    @deliveries = @course.deliveries



    @user = current_user
    #@course_new = Course.new
    #@delivery = Delivery.new

    #==== Areas de evaluación ====#
    #@areas_of_evaluation = AreasOfEvaluation.new
    #areas_of_evaluations = @delivery.areas_of_evaluations.build

    #==== Assets ====#
    #@asset = Asset.new
    #assets = @delivery.assets.build

    #@survey = Survey.new

    #@course_count = Course.count
    #@courses = current_user.members_in_courses.limit(7)

    #@count_course_iam_member =  current_user.members_in_courses.count
    #@count_course_iam_member_and_owner = current_user.members_in_courses.where(:owner => true).count

    #@network = Network.find_by_subdomain!(request.subdomain)
    #@comments = @network.comments




    respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @course }
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
             @member.title = @course.title
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
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @course.errors, status: :unprocessable_entity }
        format.js
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
    if @member
     if @member.accepted
        respond_to do |format|
           format.html # show.html.erb
           format.json { render json: @course }
         end
     else
        redirect_to courses_path, :notice => "no has sido aceptado en este curso"
     end
    else
        redirect_to courses_path, :notice => "no has sido aceptado en este curso"
    end
  end
  
  def deliveries
    @course = Course.find(params[:id])
  end
  
  def assigment
    @assignment = Assignment.new(params[:assignment])
    @asset = Asset.new(params[:asset])
    @assignment.save!
    if @assignment.save
      redirect_to :back
    else
      redirect_to :back
    end  
  end
     
end
