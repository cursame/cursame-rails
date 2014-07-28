class SurveysController < ApplicationController
  include CoursesUtils
  include SurveysUtils
  include FiltersUtils
  before_filter :only_students, :only => [:index, :lapsed, :surveys_course, :surveys_course_lapsed]

  def index
    courses = student_subscribed_courses

    surveys = courses.inject([]) do
      |accu, course|
      accu + course.surveys
    end

    surveys = surveys.sort do
      |x,y| y.end_date <=> x.end_date
    end

    @today_surveys = surveys.clone.keep_if do
      |survey|
      Time.now.to_datetime <= survey.end_date.to_datetime and survey.end_date.to_datetime <= Date.tomorrow
    end

    @tomorrow_surveys = surveys.clone.keep_if do
      |survey|
      Date.tomorrow <= survey.end_date.to_datetime and survey.end_date.to_datetime <= (Date.tomorrow + 1.day)
    end

    @rest_of_surveys = surveys.clone.keep_if do
      |survey|
      survey.end_date.to_datetime >= (Date.tomorrow + 1.day)
    end

  end

  def lapsed
    @surveys = student_lapsed_surveys.paginate(per_page: CARDS_PER_PAGE, page: 1)
  end

  def surveys_course
    member = MembersInCourse.find_by_user_id_and_course_id(current_user.id,params[:id])

    unless member.nil?
      redirect_to root_path, flash: { error: "Estas tratando de ver Cuestionarios de un curso donde no has sido aceptado."} unless member.accepted
    else
      redirect_to root_path, flash: { error: "Estas tratando de ver Cuestionarios de un curso donde no estas inscrito."}
    end

    @course = Course.find_by_id(params[:id])

    surveys = @course.surveys

    surveys = surveys.sort do
      |x,y| y.end_date <=> x.end_date
    end

    @today_surveys = surveys.clone.keep_if do
      |survey|
      Time.now.to_datetime <= survey.end_date.to_datetime and survey.end_date.to_datetime <= Date.tomorrow
    end

    @tomorrow_surveys = surveys.clone.keep_if do
      |survey|
      Date.tomorrow <= survey.end_date.to_datetime and survey.end_date.to_datetime <= (Date.tomorrow + 1.day)
    end

    @rest_of_surveys = surveys.clone.keep_if do
      |survey|
      survey.end_date.to_datetime >= (Date.tomorrow + 1.day)
    end

  end

  def surveys_course_lapsed
    member = MembersInCourse.find_by_user_id_and_course_id(current_user.id,params[:id])
    unless member.nil?
      redirect_to root_path, flash: { error: "Estas tratando de ver Cuestionarios de un curso donde no has sido aceptado."} unless member.accepted
    else
      redirect_to root_path, flash: { error: "Estas tratando de ver Cuestionarios de un curso donde no estas inscrito."}
    end

    @course = Course.find_by_id(params[:id])
    @surveys = course_lapsed_surveys(@course).paginate(per_page: CARDS_PER_PAGE, page: 1)
  end

  def paginate_ajax
    page = params[:page]
    @type = params[:type]
    @next_page = page.to_i + 1

    case @type
    when 'lapsed'
      @course = nil
      surveys_raw = student_lapsed_surveys
    when 'course_lapsed'
      @course = Course.find_by_id(params[:course])
      surveys_raw = course_lapsed_surveys(@course)
    end

    @surveys = surveys_raw.paginate(per_page: CARDS_PER_PAGE, page: page)

    respond_to do |format|
      format.js { render 'surveys/ajax/surveys_paginate_ajax' }
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(params[:survey])
    @survey.user = current_user
    @survey.network = current_network

    courses = params[:delivery] ? params[:delivery]["course_ids"] : nil

    if courses && !courses.empty?
      
      courses.each { |course_id| @survey.courses.push(Course.find_by_id(course_id)) }
        
      if @survey.save!
        @az = @survey
        @publication = Wall.find_by_publication_type_and_publication_id("Survey",@survey.id)
        @typed = "Survey"
        activation_activity
      end

    else
      @error = true
    end
    respond_to do |format|
     format.js
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    ids = []

    if !params[:delivery]
      @survey.courses.each do |course|
        ids.push(course.id)
      end
    else
      params[:delivery][:course_ids].each do |id|
        ids.push(id)
      end
    end

    if @survey.update_attributes(params[:survey])
        @survey.courses=[]
        ids.each do |id|
          @survey.courses.push(Course.find(id))
        end
      @survey.save

     @publication = Wall.find_by_publication_type_and_publication_id("Survey",@survey.id)
     respond_to do |format|
        format.js
        format.html { render action: "edit" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
     else
      format.js
    end
  end

  def survey_reply
    if user_signed_in?
      @user_survey = UserSurvey.new
      @user_survey.survey_id = params[:survey_id]
      @user_survey.user = current_user
      @user_survey.result = 0;
      @survey_id = params[:survey_id]
      @error = false

      if  params[:questions] && @user_survey.save
        params[:questions].each do |question|
          # question[1] es el id de la respuesta
          # question[0] es la id de la pregunta
          question[1].each do |answer|
            @user_response = UserSurveyResponse.new
            @user_response.user_survey_id = @user_survey.id
            @user_response.question_id = question[0]
            @user_response.answer_id = answer
            @user_response.save
          end
            @az = @user_survey
            @typed = "User_survey"
            activation_activity
        end
      else
        @error = true
      end
      # Evaluation del examen
      @user_survey.evaluation
      respond_to do |format|
        format.js
      end
    end
  end

  def publish_unpublish_survey_manualy
    @survey = Survey.find(params[:id])

    if @survey.state == 'published'
      @survey.state = 'unpublish'
      @survey.end_date = Time.now
      @message = "Se ha despublicado este cuestionario."
      @linkik = 'Publicar'

    else
      @survey.state == 'unpublish'
      @survey.state = 'published'
      @survey.publish_date = Time.now
      @survey.end_date = Time.now + 2.days
      @message = "Se ha republicado el cuestionario agregando 2 dias desde ahora."
      @linkik = 'Ocultar'

    end
    
    @survey.save!

    if @survey.save
      respond_to do |format|
        format.js
      end
    end

  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_url, :notice => "Successfully destroyed survey."
  end
end
