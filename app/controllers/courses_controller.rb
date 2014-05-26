# -*- coding: utf-8 -*-
class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  before_filter :filter_protection, :only => [:show, :edit, :destroy, :members]
  filter_access_to :show

  before_filter :course_activated, :only => [:show, :about, :members, :library]

  def index
    
    @courses = current_user.courses.where(:network_id => current_network.id, :id => operator_courses('normal') ,:active_status => true).search(params[:search])
    ##### creamos el registro de los usuarios de un curso ######
    @member = MembersInCourse.new
    #alfredot_rifa_free_pro_forever
    respond_to do |format|
      format.html {render stream: true}
      format.json { render json: @courses }
    end

  end
  
  def my_courses
     @member = MembersInCourse.new
     @courses = Course.where(:network_id => current_network.id, :id => operator_courses('normal') ,:active_status => true).search(params[:search])
    respond_to do |format|
      format.js
    end

  end

  def all_courses
    @member = MembersInCourse.new
     @courses = Course.where(:network_id => current_network.id, :id => operator_courses('inverse') ,:active_status => true).search(params[:search])
    respond_to do |format|
      format.js 
    end
  end

  def my_old_courses
   @member = MembersInCourse.new
   @courses = current_user.courses.where(:network_id => current_network.id, :id => operator_courses('normal'), :active_status => false).search(params[:search])
   respond_to do |format|
      format.js 
    end
  end
   

  def operator_courses(typed = 'normal')
    case 
      when typed == 'inverse'
          #### coloca los cursos a los que no pertenezco
          comparative_courses = []
          course_in_network = []
    
        ####### obtiene los ids de lo que pertenezco y lo que no y
          current_user.courses.each do |c|
            comparative_courses.push(c.id)
          end
    
          current_network.courses.each do |cs|
             course_in_network.push(cs.id)
          end
    
          ids = course_in_network - comparative_courses

          #puts "******************#{comparative_courses}"
          #puts "******************#{course_in_network}"
          #puts "#{ids}"
       when typed == 'normal'
          ### coloca los ids de los cursos para comparacion
          comparative_courses = []
          current_user.courses.each do |c|
            comparative_courses.push(c.id)
          end
          ids = comparative_courses

    end
  end

  def courses_search_ajax
    @member = MembersInCourse.new
    @search = params[:activiesearch].downcase
    docificate_search_changes = I18n.transliterate("#{@search}")
    #@courses = Course.search(docificate_search_changes)
    @courses = current_network.courses.search(docificate_search_changes)

    respond_to do |format|
      format.js 
    end
  end
  # GET /courses/1
  # GET /courses/1.json
  
  def statistics
    @course = Course.find(params[:id])   
  end

  def show  
    @course = Course.find(params[:id])
    
    @member = obtainMember(@course.id,current_user.id)

    if @member.nil?
      redirect_to :back
      return false
    end

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

    @id = params[:id]
    @show_assignment = params[:show_assig]
    @show_survey = params[:show_survey]
    @show_accomplishment = params[:show_accom]
    @search = params[:search]
    @id_search = params[:id_search]
    
    @page = params[:page].to_i
    @wall = @course.walls.where("publication_type != ?", 'Course').search(@search, @id_search).order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.html {render stream: true}
        format.json { render json: @course }
      end
    end

  end

  def send_mails
    @user = current_user
    @course = Course.find(params[:id])
    member = obtainMember(@course.id,@user.id)

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
    @member = MembersInCourse.find_by_course_id_and_user_id(@course.id, current_user.id)
      if @member.owner == true || current_role == "admin"
      else
        redirect_to course_path(@course)
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
        @count_course_iam_member_and_owner = MembersInCourse.where(:user_id => current_user.id, :accepted => true, :owner => true).count

        if @count_course_iam_member_and_owner == 0
           @miembro = MembersInCourse.where(course_id = @course.id).first
           @miembro.owner == true
           @miembro.save 
           puts "se le ha agregado un owner al curso"
        else
           puts "este curso tiene owner"

        end
        format.html { redirect_to course_path(@course.id) }
        
        #current_user.members_in_courses.where(:owner => true).count
        #format.json { render json: @course, status: :created, location: @course }

      else
        #format.json { render json: @course.errors, status: :unprocessable_entity }
        #format.html { redirect_to courses_url }
        #format.js
         format.html { redirect_to :back }


      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    if @course.init_date != nil
    @idate = @course.init_date.strftime('%Y-%m-%d')     
    end
    if @course.finish_date != nil
    @fdate = @course.finish_date.strftime('%Y-%m-%d')    
    end
    respond_to do |format|
      if @course.update_attributes(params[:course])
        @last_date = @course.init_date
        @last_end_date = @course.finish_date
        if @last_date  == nil 
          @last_date =  @idate
        end
        if @last_end_date == nil
          @last_end_date = @fdate 
        end
        @course.init_date = @last_date
        @course.finish_date = @last_end_date
        @course.save
        flash[:notice] = "Se han guardado satisfactoriamente los cambios en el curso. "
        format.html {redirect_to course_path(@course)}
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
      format.html { redirect_to courses_path, notice: 'Curso borrado exitosamente.' }
      format.json { head :no_content }
    end
  end

  def members
    @course = Course.find(params[:id])
    @course_member = MembersInCourse.find_by_course_id(@course.id)
    @member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, current_course.id)
    if current_role == 'admin' || current_role == 'superadmin'
      @member = MembersInCourse.new
      @member.owner = true
    else
      if @member.owner == true || current_role == "admin"
      else
      end
    end
  end

  
  def library
    @course = Course.find(params[:id])
    @member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, current_course.id)
    @files = @course.course_files.paginate(:page => 1, :per_page => 10)
  end
  
  def library_pagination
    page = (params[:page]).to_i
    @course = Course.find(params[:id])
    @member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, current_course.id)
    @files = @course.course_files.paginate(:page => page , :per_page => 10)
    @next = page + 1
    respond_to do |f|
      f.js
    end
  end
  
  def about
    id_for_users = []
    @course = current_course
    @owners = MembersInCourse.where(:course_id => @course.id, :owner => true)

    @owners.each do |o|
      id_for_users.push(o.user_id)
    end
    
    @users = User.where(:id => id_for_users)
    @member = obtainMember(@course.id,current_user.id)
  end

  def evaluation
    @course = Course.find(params[:id])
    @member = obtainMember(@course.id, current_user.id)
   
    if !@member.nil? then
      if @member.owner.nil? then
        @member.update_attributes(:owner => false)
      end
    end
    @role = current_role
  end

  def evaluation_download
    @course = Course.find(params[:id])
    @member = obtainMember(@course.id, current_user.id)
    if !@member.nil? then
      if @member.owner.nil? then
        @member.update_attributes(:owner => false)
      end
    end
    @role = current_role
  end


  def filter_protection
    @course = Course.find(params[:id])
    @member = obtainMember(@course.id,current_user.id)

    if current_role == "admin" || current_role == "superadmin"
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

    if params[:assignment]["id"].blank? then
      @assignment = Assignment.new(params[:assignment])
      flash[:notice] = "Se ha entregado correctamente una tarea."

      mixpanel_properties = { 
        'Course'  => @assignment.course.title.capitalize,
        'Network' => @assignment.course.network.name.capitalize
      }
      MixpanelTrackerWorker.perform_async @assignment.user_id, 'Assignments', mixpanel_properties

    else
      @id = params[:assignment].delete("id")
      @assignment = Assignment.find(@id)
      @assignment.update_attributes(params[:assignment])

      if params[:files] then

        assets = Array.new
        params[:files].each do |asset_id|
          assets.push(Asset.find(asset_id))
        end

        assignment_assets = @assignment.assets

        assets.each do |asset|
          if !assignment_assets.include?(asset) then
            @assignment.assets.push(asset)
          end
        end
        flash[:notice] = "Se ha actualizado correctamente entrega de una tarea."
      end
      redirect_to :back
      return
    end

    mixpanel_properties = { 
      'Network' => Network.find_by_id(@assignment.delivery.network_id).name.capitalize,
      'Course'  => @assignment.course.title.capitalize
    }
    MixpanelTrackerWorker.perform_async current_user.id, 'Assignments', mixpanel_properties
   
    # @content = Content.new(params[:content])
    #  @assignment.user_id = current_user.id
    @assignment.save!

    if @assignment.save! and @id.nil?

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
    simple = []

    count_deliveries =  @course.deliveries.count
    count_surveys =  @course.surveys.count
    count_assignmentss = assignmentss.count

    counte_fact = count_deliveries + count_surveys + count_assignmentss

    # Tareas del curso
    @course.deliveries.each do |del|
      assets_deliveries = []
        
      if del.user != nil
        del.assets.each do |b|
          @name = b.file.to_s.split('/').last
          assets_deliveries.push({file: b.file,
                                  name: ("#{@name}").delete("\n"),
                                  pertencenence_to: "tarea#{del.id}" })
        end

        case 
          when del.user.avatar.blank?
            @avatar = "http://#{current_network.subdomain}.#{links}/assets/#{del.user.image_avatarx}"
          when del.user.avatar == nil
            @avatar = "http://#{current_network.subdomain}.#{links}/assets/#{del.user.image_avatarx}"
          else
            @avatar = "http://#{current_network.subdomain}.#{links}#{del.user.avatar.profile}"
        end

        deliveries.push({
          startDate: del.publish_date,
          endDate: del.end_date,
          headline: (("#{del.title}").to_s).delete("\n"),
          text: (("Tarea: #{del.description}").to_s).delete("\n"),
          asset: {
            media: @avatar && @avatar,
            credit: (("#{del.user.name}").to_s).delete("\n"),
            caption: (("#{@course.title}").to_s).delete("\n")
          },
          compose: {
            id: del.id,
            type: 'tarea',
            title: (("#{del.title}").to_s).delete("\n"),
            description: (("#{del.description}").to_s).delete("\n"),
            pertencenence_to: "tarea#{del.id}",
            state: del.state,
            assets_integrate: assets_deliveries
          },
          assets: assets_deliveries
        })

        del.assignments.each do |as|
          assets_assignmentss = []
           
          if as.user != nil
            as.assets.each do |a|
              @name = a.file.to_s.split('/').last
              assets_assignmentss.push({file: a.file,
                                        name: ("#{@name}").delete("\n"),
                                        pertencenence_to: "entrega_tarea#{as.id}"
                                      })
            end

            case 
              when as.user.avatar.blank?
                @avatar_assignment = "http://#{current_network.subdomain}.#{links}/assets/#{as.user.image_avatarx}"
              when as.user.avatar == nil
                @avatar_assignment = "http://#{current_network.subdomain}.#{links}/assets/#{as.user.image_avatarx}"
              else
                @avatar_assignment = "http://#{current_network.subdomain}.#{links}#{as.user.avatar.profile}"
            end
           
            assignmentss.push({
              startDate: as.created_at,
              endDate: as.created_at,
              headline: (("#{as.title}").to_s).delete("\n"),
              text: (("Tarea entregada: #{as.brief_description}").to_s).delete("\n"),
              asset: {
                media:@avatar_assignment && @avatar_assignment,
                credit:(("#{as.user.name}").to_s).delete("\n"),
                caption:(("#{@course.title}").to_s).delete("\n")
              },
              compose: {
                id: as.id,
                type: 'entrega_tarea',
                title: (("#{as.title}").to_s).delete("\n"),
                description: (("#{as.brief_description}").to_s).delete("\n"),
                pertencenence_to: "entrega_tarea#{as.id}",
                state: "none",
                assets_integrate: assets_assignmentss
              },
              assets: assets_assignmentss  #+ contents_assignmentss
            })
          end
        end
      end
    end

    # Examenes del curso
    @course.surveys.each do |survey|
      if survey.user != nil
        case
          when survey.user.avatar.blank?
            @avatar_surveys = "http://#{current_network.subdomain}.#{links}/assets/#{survey.user.image_avatarx}"
          when survey.user.avatar == nil 
            @avatar_surveys = "http://#{current_network.subdomain}.#{links}/assets/#{survey.user.image_avatarx}"
          else
            @avatar_surveys = "http://#{current_network.subdomain}.#{links}#{survey.user.avatar.profile}"
        end
        
        surveyss.push({
          startDate: survey.created_at,
          endDate: survey.created_at,
          headline: (("#{survey.name}").to_s).delete("\n"),
          text: (("Cuestionario: #{survey.state}").to_s).delete("\n"),
          asset: {
            media: @avatar_survery && @avatar_survery,
            credit: (("#{survey.user.name}").to_s).delete("\n"),
            caption: (("#{@course.title}").to_s).delete("\n")
          },
          compose: {
            id: survey.id,
            type: 'examen',
            title: (("#{survey.name}").to_s).delete("\n"),
            state: survey.state,
            pertencenence_to: "entrega_survey#{survey.id}"
          }          
        })
      end
    end

    simple.push({
      startDate: @course.created_at,
      endDate: @course.created_at,
      headline:("Has a gregado el curso #{@course.title} al panel de cursos").delete("\n"),
      text:"Curso nuevo",
    })

    if counte_fact != 0
      @date = simple  + surveyss + deliveries + assignmentss
    else
      @date = simple
    end

    # @date = simple
    respond_to do |format|
      format.html
      format.json {
        render json: {
                timeline: {
                  headline: (("#{@course.title}").to_s).delete("\n"),
                  type: "default",
                  text: (("Linea del tiempo del curso #{@course.title} ").to_s).delete("\n"),
                  startDate: "#{@course.init_date}",
                  date: @date
                }
              }
            }
    end
  end

  def course_ki_line_pag
    id = Course.find(params[:id])
    page = (params[:page]).to_i
    per_page = (params[:per_page]).to_i
    @date = getActivities((page * per_page), ((page * per_page) + per_page), id)
    puts @date


    # @date = simple
    respond_to do |format|
      format.html
      format.json {
        render json: {
                timeline: {
                  headline: (("#{@course.title}").to_s).delete("\n"),
                  type: "default",
                  text: (("Linea del tiempo del curso #{@course.title} ").to_s).delete("\n"),
                  startDate: "#{@course.init_date}",
                  date: @date
                }
              }
            }
    end
  end

  def activities_depot
    @course = Course.find(params[:id])
    @member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, current_course.id)
    
    if current_role == 'admin' || current_role == 'superadmin'
      @member.owner = true
    else
      if @member.owner == true || current_role == "admin"
      else
        redirect_to course_path(@course)
      end
    end
  end

  def load_more_activities
    @course_id = Course.find(params[:id])
    @page = (params[:page]).to_i
    @per_page = (params[:per_page]).to_i

    respond_to do |format|
      format.js
      format.json
    end
  end

  ###### Metodo que devuelve de start a end notificaciones
  def getActivities(startN, endN, idCourse)
    @course = Course.find(params[:id])
    per_page = params[:per_page].to_i
    page = params[:page].to_i

    deliveries = []
    assignmentss = []
    surveyss = []
    simple = []

    count_deliveries =  @course.deliveries.count
    count_surveys =  @course.surveys.count
    count_assignmentss = assignmentss.count

    counte_fact = count_deliveries + count_surveys + count_assignmentss

    # Tareas del curso
    @course.deliveries.each do |del|
      assets_deliveries = []
        
      if del.user != nil
        del.assets.each do |b|
          @name = b.file.to_s.split('/').last
          assets_deliveries.push({file: b.file,
                                  name: ("#{@name}").delete("\n"),
                                  pertencenence_to: "tarea#{del.id}" })
        end

        case 
          when del.user.avatar.blank?
            @avatar = "http://#{current_network.subdomain}.#{links}/assets/#{del.user.image_avatarx}"
          when del.user.avatar == nil
            @avatar = "http://#{current_network.subdomain}.#{links}/assets/#{del.user.image_avatarx}"
          else
            @avatar = "http://#{current_network.subdomain}.#{links}#{del.user.avatar.profile}"
        end

        deliveries.push({
          startDate: del.publish_date,
          endDate: del.end_date,
          headline: (("#{del.title}").to_s).delete("\n"),
          text: del.description.to_s.delete("\n"),
          asset: {
            media: @avatar && @avatar,
            credit: (("#{del.user.name}").to_s).delete("\n"),
            caption: (("#{@course.title}").to_s).delete("\n")
          },
          compose: {
            id: del.id,
            type: 'tarea',
            title: (("#{del.title}").to_s).delete("\n"),
            description: (("#{del.description}").to_s).delete("\n"),
            pertencenence_to: "tarea#{del.id}",
            state: del.state,
            assets_integrate: assets_deliveries
          },
          assets: assets_deliveries
        })

        del.assignments.each do |as|
          assets_assignmentss = []
           
          if as.user != nil
            as.assets.each do |a|
              @name = a.file.to_s.split('/').last
              assets_assignmentss.push({file: a.file,
                                        name: ("#{@name}").delete("\n"),
                                        pertencenence_to: "entrega_tarea#{as.id}"
                                      })
            end

            case 
              when as.user.avatar.blank?
                @avatar_assignment = "http://#{current_network.subdomain}.#{links}/assets/#{as.user.image_avatarx}"
              when as.user.avatar == nil
                @avatar_assignment = "http://#{current_network.subdomain}.#{links}/assets/#{as.user.image_avatarx}"
              else
                @avatar_assignment = "http://#{current_network.subdomain}.#{links}#{as.user.avatar.profile}"
            end
           
            assignmentss.push({
              startDate: as.created_at,
              endDate: as.created_at,
              headline: (("#{as.title}").to_s).delete("\n"),
              text: (("Tarea entregada: #{as.brief_description}").to_s).delete("\n"),
              asset: {
                media:@avatar_assignment && @avatar_assignment,
                credit:(("#{as.user.name}").to_s).delete("\n"),
                caption:(("#{@course.title}").to_s).delete("\n")
              },
              compose: {
                id: as.id,
                type: 'entrega_tarea',
                title: (("#{as.title}").to_s).delete("\n"),
                description: (("#{as.brief_description}").to_s).delete("\n"),
                pertencenence_to: "entrega_tarea#{as.id}",
                state: "none",
                assets_integrate: assets_assignmentss
              },
              assets: assets_assignmentss  #+ contents_assignmentss
            })
          end
        end
      end
    end

    # Examenes del curso
    @course.surveys.each do |survey|
      if survey.user != nil

        case
          when survey.user.avatar.blank?
            @avatar_surveys = "http://#{current_network.subdomain}.#{links}/assets/#{survey.user.image_avatarx}"
          when survey.user.avatar == nil 
            @avatar_surveys = "http://#{current_network.subdomain}.#{links}/assets/#{survey.user.image_avatarx}"
          else
            @avatar_surveys = "http://#{current_network.subdomain}.#{links}#{survey.user.avatar.profile}"
        end

        surveyss.push({
          startDate: survey.created_at,
          endDate: survey.created_at,
          headline: (("#{survey.name}").to_s).delete("\n"),
          text: "",
          asset: {
            media: @avatar_surveys && @avatar_surveys,
            credit: (("#{survey.user.name}").to_s).delete("\n"),
            caption: (("#{@course.title}").to_s).delete("\n")
          },
          compose: {
            id: survey.id,
            type: 'examen',
            state: survey.state,
            title: (("#{survey.name}").to_s).delete("\n"),
            questions_count: survey.questions.count
          }
        })
      end
    end

    simple.push({
      startDate: @course.created_at,
      endDate: @course.created_at,
      headline:("Has a gregado el curso #{@course.title} al panel de cursos").delete("\n"),
      text:"Curso nuevo",
    })

    if counte_fact != 0
      @date = simple  + surveyss + deliveries + assignmentss
    else
      @date = simple
    end

    @date = @date.sort {
      |a, b|

      a[:startDate] <=> b[:startDate]
    }
    @date = @date.reverse

    @date = @date[startN ... endN]

    return @date
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

  def course_assignment_notif
    @assignment = Assignment.find(params[:id])
    
     respond_to do |format|
        #format.html
        format.js
        format.json
      end
  end

  def course_delivery_actdepot
    @delivery     = Delivery.find(params[:id])
    @assignments  = @delivery.assignments
    @count        = @assignments.count
    @deliveries   = Array.new
    
    @assignments.each do |assign|
      user = User.find(assign.user_id)

      @deliveries << {
        id: assign.id,
        title: assign.title,
        description: assign.brief_description,
        user_id: assign.user_id,
        user_name: "#{user.first_name} #{user.last_name}",
        user_avatar: avatar('user', '45', 'no',assign.user_id, 'avatar', 'no', 'no'),
        updated_at: assign.updated_at,
        accomplishment: assign.accomplishment,
        type: "tarea"
      }
    end

    puts 
    respond_to do |format|
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

  def course_survey_notif
    @responces = UserSurvey.find(params[:id])

    respond_to do |format|
      #format.html
      format.js
      format.json
    end
    
  end

  def course_survey_actdepot
    @survey = Survey.find(params[:id])
    puts "#{@survey.publish_date}"
    puts "#{@survey.end_date}"
    puts "#{@survey.state}"

    @responces = @survey.user_surveys
    @survey_replies = Array.new
    p @survey

    @responces.each do |survey_reply|
      user = User.find(survey_reply.user_id)

      @survey_replies << {
        id: survey_reply.id,
        result: survey_reply.result,
        user_name: "#{user.first_name} #{user.last_name}",
        user_avatar: avatar('user', '45', 'no', survey_reply.user_id, 'avatar', 'no', 'no'),
      }
    end

    respond_to do |format|
      #format.html
      format.js
      format.json
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
      # Notificando a todos los usuarios que el curso se desactivo
      @course.users.each do |member|
        Notification.create(:users => [member], :notificator => @course, :kind => 'course_deactivated')
      end

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

  def clone_course_view
    @course = Course.find(params[:id])
    respond_to do |format|
        format.html
        # format.json
        # format.js
    end
  end
   
  def clone_course

    @course = Course.new(params[:course])
    @course.title = "#{@course.title}"
    @course.network = current_network
    if @course.save!

    if params[:deliveries] != nil
      deliveries_to_save = []

      params[:deliveries].map do |key, value|
        next if value["id"].blank? || value["id"].nil?
        valid = { "id" => value["id"], "publish_date" => value["publish_date"], "end_date" => value["end_date"] }
        deliveries_to_save.push valid
      end

      deliveries_to_save.each do |obj|
        new_delivery = Delivery.find(obj["id"]).dup
        new_delivery.state = 'unpublish'
        new_delivery.publish_date = obj["publish_date"]
        new_delivery.end_date = obj["end_date"]
        new_delivery.courses.push(@course)
        new_delivery.save!
      end
    end

      if params[:discussions] != nil
      params[:discussions].each do |id|
        new_discussion = Discussion.find(id).dup
        new_discussion.courses.push(@course)
        new_discussion.save!
      end
      end

      if params[:surveys] != nil
        surveys_to_save = []

        params[:surveys].map do |key, value|
          next if value["id"].blank? || value["id"].nil? 
          valid = { "id" => value["id"], "publish_date" => value["publish_date"], "end_date" => value["end_date"] }
          surveys_to_save.push valid
        end

        surveys_to_save.each do |obj|
          new_survey = Survey.find(obj["id"]).dup
          new_survey.state = 'unpublish'
          new_survey.publish_date = obj["publish_date"]
          new_survey.end_date = obj["end_date"]
          new_survey.courses.push(@course)

          #agregamos preguntas al survey
          Survey.find(obj["id"]).questions.each do |question|
            new_question = question.dup;
            question.answers.each do |answer|
              new_question.answers.push(answer.dup)
            end
            new_survey.questions.push(new_question)
          end

          new_survey.save!
        end
      end

      if params[:course_files] != nil      
      params[:course_files].each do |id|
        new_course_file = CourseFile.find(id).dup
        new_course_file.file = CourseFile.find(id).file
        new_course_file.save!
        new_course_id_course_file_id = CourseIdCourseFileId.new
        new_course_id_course_file_id.course = @course
        new_course_id_course_file_id.course_file = new_course_file
        new_course_id_course_file_id.save!
      end
      end
    end

    if @course.save 
      owner = MembersInCourse.create(:course_id => @course.id, :user_id => current_user.id, :accepted => true, :owner => true, :network_id => current_network.id )
      redirect_to course_path(@course), :notice => "Curso clonado correctamente."
    end
  end

private 

  def obtainMember(course_id, user_id)
    member = MembersInCourse.find_by_course_id_and_user_id(course_id,user_id)
    
    if (member.nil?) 
      superadmin = current_role == "superadmin"
      admin = current_role == "admin"
      if (superadmin || admin)
        member = MembersInCourse.new
        member.course_id = @course.id
        member.user_id = current_user.id
        member.accepted = true
        member.owner = true
        member.network_id = current_network.id
      end
   
    end
    return member
  end

  def course_activated
    @course = Course.find(params[:id])
    if !@course.active_status && !@course.members_in_courses.find_by_user_id(current_user.id).owner
      @courses = current_user.courses.where(:network_id => current_network.id, :id => operator_courses('normal') ,:active_status => true).search(params[:search])
      @member = MembersInCourse.new
      render :index
    end
  end

end
