class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  before_filter :filter_protection, :only => [:show, :edit, :destroy, :members]
  filter_access_to :show

  def index
    @courses = Course.where(:network_id => current_network.id, :active_status => true).search(params[:search])
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
    # @user = current_user
    # @course_new = Course.new
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

    @id = params[:id]
    @search = params[:search]
    @page = params[:page].to_i
    # @wall = @course.walls.where('public = ? OR user_id = ?',true,current_user.id).search(@search,@id).order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    @wall = @course.walls.where("publication_type != ?", 'Course').search(@search, nil).order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    
    if request.xhr?      
      respond_to do |format|
        format.js
      end           
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @course }
      end
    end

  end



  def send_mails
    @user = current_user
    @course = Course.find(params[:id])
    member = MembersInCourse.find_by_user_id_and_course_id(@user.id,params[:id])

    if !member.owner then
      redirect_to course_path(@course)
    end
  end

  def sending
    @course = Course.find(params[:course_id])
    @course.members_in_courses.each do |member|
      mail = Notifier.send_email_members_in_course(member,params[:subject],params[:message])
      mail.deliver
    end
    respond_to do |format|
        format.html{redirect_to course_path(@course)}
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
            @publication = Wall.find_by_publication_type_and_publication_id("Course",@course.id)
            @az =  @course
            @typed = "Course"
        activation_activity
        @courses = current_user.members_in_courses.limit(7)
        @course_count = Course.count
        @ccc = current_user.courses.where(:network_id => current_network.id)
        @count_course_iam_member =  @ccc.where(:active_status => true).count
        @count_course_iam_member_and_owner = MembersInCourse.where(:user_id => current_user.id, :accepted => true).count
        #current_user.members_in_courses.where(:owner => true).count
        #format.json { render json: @course, status: :created, location: @course }
        #format.html { redirect_to courses_url }
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
        format.html { redirect_to :back }
        format.json { head :no_content }
      else
        format.html { redirect_to :back }
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
    @member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, current_course.id)
    if current_role == 'admin' || 'superadmin'
    else
      if @member.owner = true || current_role = "admin"
      else
        redirect_to :back
      end
    end
  end


  def evaluation
    @course = Course.find(params[:id])
    @member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, @course.id)
    if !@member.nil? then
      if @member.owner.nil? then
        @member.update_attributes(:owner => false)
      end
    end
    @role = current_role
  end

  def filter_protection
     @course = Course.find(params[:id])
     @member = MembersInCourse.find_by_course_id_and_user_id(@course.id,current_user.id)
    
    if current_role == "admin" 
    else 
      if @member
        if @member.accepted
          # respond_to do |format|
          #   format.js
          #   format.html # show.html.erb
          #   format.json { render json: @course }
          # end
        else
         redirect_to courses_path, :notice => "no has sido aceptado en este curso"
        end
      else
          redirect_to courses_path, :notice => "no has sido aceptado en este curso"
      end
    end
  end

  def deliveries
    @course = Course.find(params[:id])
  end

  def assigment
    @assignment = Assignment.new(params[:assignment])
   # @content = Content.new(params[:content])
    @assignment.user_id = current_user.id
    @assignment.save!

    if @assignment.save!

      # @publication = Wall.find_by_publication_type_and_publication_id("Delivery",@delivery.id)

      @delivery_from_assignment = Delivery.find(@assignment.delivery)


      @delivery_from_assignment.areas_of_evaluations.each_with_index do | generate_rubres, index |

        @response_to_the_evaluation = ResponseToTheEvaluation.new(params[:response_to_the_evaluation])
        @response_to_the_evaluation.name = generate_rubres.name
        @response_to_the_evaluation.comment_for_rubre = generate_rubres.description
        @response_to_the_evaluation.evaluation_porcentage = generate_rubres.evaluation_percentage
        @response_to_the_evaluation.assignment_id = @assignment.id
        @response_to_the_evaluation.save

      end
      #actualizamos los assets del assignment
      if(params[:files])
        params[:files].each do |asset_id|
          @asset = Asset.find(asset_id)
          @assignment.assets.push(@asset)
        end
      end


      @typed = "Assignment"
      @az =  @assignment

      ####### despues de guardar se crea la notificación de actividad con geo localización
      activation_activity


      if @activity.save
        redirect_to :back
      else
      end
    end
  end

  def dashboard_deliver
  end
  
  def course_ki_line
      @course = Course.find(params[:id])
      deliveries = []
      assignmentss = []
      surveyss = []
      assets_assignmentss =[]
      assets_deliveries =[]
      #contents_assignmentss =[]
      
      count_deliveries =  @course.deliveries.count
      count_surveys =  @course.surveys.count
      
      counte_fact = count_deliveries + count_surveys
      
      
      @course.deliveries.each do |del|
        del.assets.each do |b|
           @name = b.file.to_s.split('/').last
           assets_deliveries.push({file: b.file,
                                   name:("#{@name}").delete("\n") })
         end
        if del.user.avatar.blank?
          @avatar = "/assets/#{del.user.image_avatarx}"
        else
          @avatar = del.user.avatar.profile
          
        end
        
        
        deliveries.push(
          {
              startDate: del.publish_date,
              endDate: del.end_date,
              headline:("#{del.title}").delete("\n"),
              text:("Tarea: #{del.description}").delete("\n"),
              asset:
              {
                  media: @avatar.url,
                  credit:("#{del.user.name}").delete("\n"),
                  caption:("#{@course.title}").delete("\n")
              },
              compose:
              { id: del.id,
                type: 'tarea',
                title:("#{del.title}").delete("\n"),
                description:("#{del.description}").delete("\n")
              },
              assets:assets_deliveries          
              
          }
          
       
        )
        
        
         del.assignments.each do |as|
           as.assets.each do |a|
             @name = a.file.to_s.split('/').last
             assets_assignmentss.push({file: a.file,
                                        name:("#{@name}").delete("\n")
                                     })
           end
=begin          
           as.contents.each do |ca|
             @name = ca.content.to_s.split('/').last
             contents_assignmentss.push( {file: ca.content,
                                         name:   @name
                                      })
           end
=end
           if as.user.avatar.blank?
             @avatar_assignment = "/assets/#{as.user.image_avatarx}"
           else
             @avatar_assignment = as.user.avatar.profile

           end
            assignmentss.push(
                {
                    startDate: as.created_at,
                    endDate: as.created_at,
                    headline:("#{as.title}").delete("\n"),
                    text:("Tarea entregada: #{as.brief_description}").delete("\n"),
                    asset:
                    {
                        media: @avatar_assignment.url,
                        credit:("#{as.user.name}").delete("\n"),
                        caption:("#{@course.title}").delete("\n")
                    },
                    compose:
                    { id: as.id,
                      type: 'entrega_tarea',
                      title: ("#{as.title}").delete("\n"),
                      description: ("#{as.brief_description}").delete("\n"), 
                    }, 
                    assets: assets_assignmentss  #+ contents_assignmentss  
                        
                    
                }
            
            )
            
          end
        
      end
      
      @course.surveys.each do |survey|
          if survey.user.avatar.blank?
            @avatar = "/assets/#{survey.user.image_avatarx}"
          else
            @avatar = survey.user.avatar.profile

          end
          surveyss.push(
              {
                  startDate: survey.created_at,
                  endDate: survey.created_at,
                  headline:("#{survey.name}").delete("\n"),
                  text:("Cuestionario: #{survey.state}").delete("\n"),
                  asset:
                  {
                      media: @avatar_assignment.url,
                      credit:("#{survey.user.name}").delete("\n"),
                      caption:("#{@course.title}").delete("\n")
                  },
                  compose:
                  {   id: survey.id,
                      type: 'examen',
                      title: ("#{survey.name}").delete("\n") 
                  }
              }
          
          )
      end
      if counte_fact != 0
      respond_to do |format|
      format.html    
      format.json { render json:
        {
        timeline: {
                      headline:("#{@course.title}").delete("\n"),
                      type:"default",
                      text: ("Linea del tiempo del curso #{@course.title} ").delete("\n"),
                      startDate:"#{@course.init_date}",
                      
                      date: surveyss + deliveries + assignmentss
                                            
                  }
        }
      }
      end
      end
  end
  
  
  def activities_depot
    @course = Course.find(params[:id])
   # @render = ("#{course_ki_line_path(@course)}.json").to_s
    
  end
  
  ######  formato para responder la jamada de ajax con js

  def call_assignments_response
    @assignment = Assignment.find(params[:id])
    @data = params[:data]
    @typeo = "assignment"

    respond_to do |format|
      #format.html
      format.json
      format.js
    end
  end
  
  def course_assignment
    @assignment = Assignment.find(params[:id])
     respond_to do |format|
        #format.html
        format.json
        format.js
      end
  end
  
  def course_survey
    @responces = UserSurvey.find(params[:id])
    
     respond_to do |format|
        #format.html
        format.json
        format.js
      end
    
  end

  def delivery_menu
    respond_to do |format|
      #format.html
      format.json
      format.js
    end
  end

  def active_status
      @course = Course.find(params[:id])

        if @course.active_status == true
             @course.active_status = 2
             @course.save
             puts "ha sido guardado en el sistema el estatus del curso (#{@course.active_status})"
             @course.members_in_courses.each do |co|
               co.active_status = 2
               co.save
             end
        else
             @course.active_status = 1
             @course.save
             @course.members_in_courses.each do |co|
                co.active_status = 1
                co.save
              end
             puts "ha sido guardado en el sistema el estatus del curso (#{@course.active_status})"

        end

     if @course.save
      respond_to do |format|
        #format.html
        format.json
        format.js
      end
     end
  end

  def edit_delivery_access
    @delivery = Delivery.find(params[:id])
    @data = params[:data]
    @typeo = "delivery"
     respond_to do |format|
        #format.html
        format.json
        format.js
      end
  end

end
