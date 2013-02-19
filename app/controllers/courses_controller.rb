class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  before_filter :filter_protection, :only => [:show, :edit, :destroy, :members] 
  filter_access_to :show
  
  def index
    @courses = Course.where(:network_id => current_network.id).search(params[:search])
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
    @course_member = MembersInCourse.find_by_course_id(@course.id)
    @deliveries = @course.deliveries.where(:status => "publish")
    @unpubliushed_deliveries = @course.deliveries.where(:status => "unpublish")
    @asset = Asset.new
     @ll = @course.users
    #@user = current_user
    #@course_new = Course.new
    @delivery = Delivery.new
    @survey = Survey.new

    #==== Assets ====#
    @asset = Asset.new
    assets = @delivery.assets.build

    #==== Areas de evaluación ====#
    #@areas_of_evaluation = AreasOfEvaluation.new
    #areas_of_evaluations = @delivery.areas_of_evaluations.build

    #==== Assets ====#
    #@asset = Asset.new
    #assets = @delivery.assets.build

    #@survey = Survey.new

    #@course_count = Course.count
    #@courses = current_user.members_in_courses.limit(7)
    

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
      format.js
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
     @member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, current_course.id)
      if @member.owner = true || current_role = "admin"
      else
        redirect_to :back
      end
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])
    @course.network = current_network
    respond_to do |format|
      if @course.save
        
           @member = MembersInCourse.new
             @member.user_id = current_user.id
             @member.course_id =  @course.id
             @member.accepted = true
             @member.owner = true
             @member.network_id = current_network.id
             @member.title = @course.title
             @member.save

        #format.json { render json: @course, status: :created, location: @course }
        format.html { redirect_to courses_url }
        format.js
      else
        #format.json { render json: @course.errors, status: :unprocessable_entity }
        format.html { redirect_to courses_url }
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
    @member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, current_course.id)
    if @member.owner = true || current_role = "admin"
    else
      redirect_to :back
    end
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
    @asset.save!
    @assignment.save!
      puts "**************"
      puts "assignment save "
      puts "**************"
      
     if @assignment.save!
            puts "************************************************************************"
            
           @delivery_from_assignment = Delivery.find(@assignment.delivery)
            puts  @delivery_from_assignment
           
                @delivery_from_assignment.areas_of_evaluations.each do |generate_rubres|
                  @response_to_the_evaluation = ResponseToTheEvaluation.new(params[:response_to_the_evaluation])
                  @response_to_the_evaluation.name = generate_rubres.name
                  @response_to_the_evaluation.comment_for_rubre = generate_rubres.description
                  @response_to_the_evaluation.evaluation_porcentage = generate_rubres.evaluation_percentage
                  @response_to_the_evaluation.assignment_id = @assignment.id
                  @response_to_the_evaluation.save!
                  
                   puts "******** se han generado las areas de evaluacion ************"
                end
                
            
             
             if @response_to_the_evaluation.save
             redirect_to :back
             else
             end
                
      else
      end
  end
     
end
