 # -*- coding: utf-8 -*-
class CoursesController < ApplicationController
  include CoursesUtils
  include FiltersUtils
  before_filter :filter_protection, only: [:show, :edit, :destroy, :members]
  before_filter :course_activated, only: [:show, :about, :members, :library, :closure, :evaluation_schema]
  before_filter :validations, only: :evaluation_schema
  before_filter :delivery_end_date_finished, only: :assigment
  filter_access_to :show

  rescue_from Errors::ErrorResponseAppBit, with: :error_connection

  def index
    @member = MembersInCourse.new

    if current_user.superadmin?
      @courses = published_courses.paginate(:per_page => COURSES_PER_PAGE, :page => 1)
    elsif current_user.admin?
      @courses = published_courses.paginate(:per_page => COURSES_PER_PAGE, :page => 1)
    elsif current_user.teacher?
      @courses = teacher_published_courses.paginate(:per_page => COURSES_PER_PAGE, :page => 1)
    elsif current_user.student?
      @courses = student_subscribed_courses.paginate(:per_page => COURSES_PER_PAGE, :page => 1)
    end

    respond_to do |format|
      format.html { render stream: true}
      format.json { render json: @courses }
    end
  end

  def unpublished
    @member = MembersInCourse.new
    @courses = teacher_unpublished_courses.paginate(:per_page => COURSES_PER_PAGE, :page => 1)

    @courses = unpublished_courses.paginate(:per_page => COURSES_PER_PAGE, :page => 1) if current_user.admin?

    respond_to do |format|
      format.html { render 'courses/unpublished_courses' }
    end
  end

  def paginate_ajax
    page = params[:page]
    @member = MembersInCourse.new
    @next_page = page.to_i + 1

    if current_user.admin?
      @courses = published_courses.paginate(per_page: COURSES_PER_PAGE, page: page)
    elsif current_user.teacher?
      @courses = teacher_published_courses.paginate(per_page: COURSES_PER_PAGE, page: page)
    elsif current_user.student?
      @courses = student_subscribed_courses.paginate(per_page: COURSES_PER_PAGE, page: page)
    end

    @state = params[:state]
    @user_role = current_user.permissionings.last.role.title

    respond_to do |format|
      format.js { render 'courses/ajax/courses_paginate_ajax' }
    end
  end

  def search
    raw_query = params[:query]
    return redirect_to courses_path, flash: { error: t('.courses_controller.search') } unless raw_query

    query = I18n.transliterate(raw_query.downcase.to_s)

    @member = MembersInCourse.new


    if current_user.teacher?
      @courses = current_user.courses.search(query)
    elsif current_user.student?
      @courses = current_network.courses.search(query)
    elsif current_user.admin?
      @courses = current_network.courses.search(query)
    end

    respond_to do |format|
      format.html { render 'courses/search/courses_search_results' }
    end
  end

  def statistics
    @course = Course.find(params[:id])
  end

  def show
    @course = Course.find(params[:id])
    @member = obtainMember(@course.id, current_user.id)

    redirect_to root_path, flash: { error: t('.courses_controller.no_exist')} and return if current_network.id != @course.network_id

    if @member.nil?
      # redirect_to :back
      redirect_to_back_or_default
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
      begin
        mail = Notifier.send_email_members_in_course(member,params[:subject],params[:message])
        mail.deliver
      rescue
      end
    end
    respond_to do |format|
      format.html{redirect_to course_path(@course)}
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    respond_to do |format|
      if @course.update_attributes(params[:course])
        flash[:notice] = t('.courses_controller.save')
        format.html {redirect_to course_path(@course)}
        format.json { head :no_content }
      else
        format.html { redirect_to :back }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def members
    @course = Course.find(params[:id])
    @course_member = MembersInCourse.find_by_course_id(@course.id)
    @member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, current_course.id)

    if current_user.admin?
      @member = MembersInCourse.new
      @member.owner = true
    end
  end

  def library
    @course = Course.find(params[:id])
    @member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, current_course.id)
    @course_files = @course.course_files.paginate(:page => 1, :per_page => 10)
    @library = @course.library
    @files = @library.library_files
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

  def evaluation_schema
    user_is_owner?(@course, current_user, current_role)
    @member = obtainMember(@course.id, current_user.id)
    render "evaluation_schema_periods" unless @course.evaluation_periods.blank?
  end

  def closure
    # TODO: Filtro si no ha calificado alguna actividad, mostrar mensaje con actividades que falten por calificar.
    @course = Course.find_by_id params[:id]

    respond_to do |format|
      format.html { render 'courses/closure/closure_members' }
    end
  end

  def closure_user_overview
    @course = Course.find_by_id params[:course_id]
    @user_course = MembersInCourse.find_by_id params[:member_id]

    respond_to do |format|
      format.html { render 'courses/closure/user_closure_overview' }
    end
  end

  def validations
    @course = Course.find_by_id(params[:id])
    course_exist?(@course)
  end

  def filter_protection
    @course = Course.find_by_id params[:id]
    @member = @course.nil? ? nil : obtainMember(@course.id, current_user.id)
    unless current_user.admin? || @member.nil? || @member.accepted?
      redirect_to courses_path, :notice => t('.courses_controller.no_accepted') and return
    end
  end

  def deliveries
    @course = Course.find(params[:id])
  end

  def assigment
    if params[:assignment][:id].blank?
      assignment = Assignment.create params[:assignment]
      flash[:success] = assignment.valid? ? t(".assignments.messages.create.success") : t(".assignments.messages.create.error")
      mixpanel_properties = {
        'Network'   => assignment.course.network.name.capitalize,
        'Subdomain' => assignment.course.network.subdomain,
        'Course'    => assignment.course.title.capitalize
      }
      track_event current_user.id, 'Assignments', mixpanel_properties
    else
      assignment = Assignment.find_by_id params[:assignment][:id]
      assignment.update_attributes params[:assignment]
      flash[:success] = assignment.valid? ? t(".assignments.messages.update.success") : t(".assignments.messages.update.error")
    end
    params[:files].to_a.each do |asset_id|
      asset = Asset.find_by_id asset_id
      assignment.assets.push asset unless assignment.assets.include? asset
    end
    redirect_to :back and return
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
                  headline:("Has agregado el curso #{@course.title} al panel de cursos").delete("\n"),
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

    if current_user.admin?
      @member.owner = true
    elsif !@member.owner && !current_user.admin?
      redirect_to course_path(@course)
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

    @responces = @survey.user_surveys
    @survey_replies = Array.new

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

    end

    if @course.save
      # Notificando a todos los usuarios que el curso se desactivo
      @course.users.each do |member|
        Notification.create(:users => [member], :notificator => @course, :kind => 'course_deactivated')
      end

      if current_user.admin?
        message_active_status_true = t('.courses_controller.the_course') + "#{@course.title}" + t('.courses_controller.active')
        message_active_status_false = t('.courses_controller.the_course') + "#{@course.title}" + t('.courses_controller.ended')
      else
        message_active_status_true = t('.courses_controller.your_course') + "#{@course.title}" + t('.courses_controller.active')
        message_active_status_false = t('.courses_controller.your_course') + "#{@course.title}" + t('.courses_controller.ended')
      end

      if @course.active_status
        redirect_to(course_path(@course), flash: { success: message_active_status_true }) and return
      else
        redirect_to(courses_unpublished_path, flash: { notice: message_active_status_false }) and return
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

      EvaluationCriterium.create(name: 'cursame_deliveries', evaluable: @course, evaluation_percentage: 34)
      EvaluationCriterium.create(name: 'cursame_surveys', evaluable: @course, evaluation_percentage: 33)
      EvaluationCriterium.create(name: 'cursame_discussions', evaluable: @course, evaluation_percentage: 33)

      redirect_to course_path(@course), :notice => t('.courses_controller.clone_correct')
    end
  end

  private

  def obtainMember(course_id, user_id)
    member = MembersInCourse.find_by_course_id_and_user_id(course_id,user_id)

    if member.nil?
      if current_user.admin?
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
    @course = Course.find_by_id(params[:id])
    redirect_to(root_path, flash: { error: t('.courses_controller.no_access') }) and return if @course.nil?
    unless current_user.admin?
      if ! @course.active_status && @course.owner?(current_role, current_user)
        redirect_to(courses_unpublished_path, flash: { notice: "#{@course.title}" + t('.courses_controller.has_ended') }) and return
      elsif ! @course.active_status && current_user.student?
        redirect_to(courses_path, flash: { notice: t('.courses_controller.the_course') + "#{@course.title}" + t('.courses_controller.contact') }) and return
      end
    end
  end

  def error_connection
    info_flash = { error: "Ocurrio un error, no se pudo enviar la información a Bit" }
    redirect_to :back, flash: info_flash
  end

  def delivery_end_date_finished
    delivery = Delivery.find_by_id params[:assignment][:delivery_id]
    if !delivery.end_date.nil? && delivery.end_date < DateTime.now
      redirect_to(root_path, flash: { error: t('.courses_controller.delivery_end_date_finished_message') }) && return
    end
  end
end
