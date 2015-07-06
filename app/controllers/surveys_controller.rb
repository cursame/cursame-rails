class SurveysController < ApplicationController
  include CoursesUtils
  include SurveysUtils
  include FiltersUtils
  before_filter :only_students, only: [:index, :lapsed, :surveys_course, :surveys_course_lapsed]
  before_filter :validations, only: :show

  include BitUtils
  rescue_from Errors::ErrorResponseAppBit, with: :error_connection

  def index
    courses = student_subscribed_courses

    surveys = courses.inject([]) do
      |accu, course|
      accu + course.surveys
    end

    surveys = surveys.keep_if {|survey| survey.state == 'published'}

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
      redirect_to root_path, flash: { error: t('.surveys_controller.no_accept')} unless member.accepted
    else
      redirect_to root_path, flash: { error: t('.surveys_controller.no_register')}
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
      redirect_to root_path, flash: { error: t('.surveys_controller.no_quest_accept')} unless member.accepted
    else
      redirect_to root_path, flash: { error: t('.surveys_controller.no_quest_register')}
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

    @wall = Wall.find_by_publication_type_and_publication_id( 'Survey', @survey.id )
  end

  def new
    @survey = Survey.new
  end

  def create
    @publication = []

    if params[:delivery] && params[:delivery]["course_ids"]
      courses = params[:delivery]["course_ids"]
    else
      courses = []
    end

    if params[:delivery]
      evaluation_periods_ids = params[:delivery].delete("evaluation_periods")
    else
      evaluation_periods_ids = []
    end

    evaluation_period_by_course = {}
    if evaluation_periods_ids
      evaluation_periods_ids.each do |id|
        evaluation_period = EvaluationPeriod.find_by_id(id)
        courses.push(evaluation_period.course_id)
        evaluation_period_by_course[evaluation_period.course_id] = id
      end
    end

    courses.uniq!

    if !courses.empty?
      courses.each do |courseId|

        @survey = Survey.new(params[:survey])
        @survey.user = current_user
        @survey.network = current_network
        @survey.courses = [Course.find_by_id(courseId)]

        @survey.evaluation_period_id = evaluation_period_by_course[courseId]

        if params[:delivery][:evaluation_period_id]
          @survey.evaluation_period_id = params[:delivery][:evaluation_period_id].first.to_i
        end

        if @survey.save

          if params[:files]
            params[:files].each do |asset_id|
              @asset = Asset.find_by_id asset_id
              @survey.assets.push @asset unless @asset.nil?
            end
          end
          @publication.push(Wall.find_by_publication_type_and_publication_id("Survey",@survey.id))
          @typed = "Survey"
          @az = @survey
          activation_activity
          link_survey_to_bit(@survey) unless @survey.evaluation_period_id.nil?
        else
          @error_evaluation_period = true
        end
      end
    else
      @error_course = true
    end

    respond_to do |format|
      format.js
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find_by_id(params[:id])
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
        @survey.courses.push(Course.find_by_id(id))
      end
      @survey.save

      if params[:files]
        params[:files].each do |asset_id|
          flag = true
          @survey.assets.each do |asset_survey|
            flag = false if asset_id.to_i == asset_survey.id
          end
          if flag
            @asset = Asset.find_by_id asset_id
            @survey.assets.push @asset unless @asset.nil?
          end
        end
      end

      @wall_publication = Wall.find_by_publication_type_and_publication_id("Survey",@survey.id)
      respond_to do |format|
        format.js
        format.html { render action: "edit" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end

      @survey.after_update_survey

    else
      format.js
    end
  end

  def survey_reply
    if user_signed_in?
      @user_survey = UserSurvey.new
      @user_survey.survey_id = params[:survey_id]
      @user_survey.user = current_user
      #@user_survey.result = 0;
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
      sending_grade_survey_to_bit(@user_survey) unless @user_survey.survey.evaluation_period_id.nil?
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

  def survey_add_attemp
    @user_survey = UserSurvey.find_by_user_id_and_survey_id(params[:user], params[:survey])
    @attemp = TimeTryingSurvey.find_by_user_id_and_survey_id(params[:user], params[:survey])
    if @user_survey
      @user_survey.destroy
    end
    if @attemp
      @attemp.destroy
    end
    @uid = params[:user]

    respond_to do |format|
        format.js
      end
  end

  def destroy
    @survey = Survey.find_by_id(params[:id])
    @survey.destroy
    redirect_to surveys_url, :notice => "Successfully destroyed survey."
  end

  def validations
    @survey = Survey.find_by_id(params[:id])
    redirect_to root_path, flash: { error: t('.surveys_controller.no_exist')} and return if @survey.nil?
    course_member?(current_user, @survey.courses.first)
  end

  def error_connection
    @error_link_to_bit = true
    @error = true
    respond_to do |format|
      format.js
    end
  end
end
