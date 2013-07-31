class SurveysController < ApplicationController
  def index
  #  @course = Course.find()
    @surveys = Survey.all
    # @surveys = @course.surveys
  end

  def show
    @survey = Survey.find(params[:id])
    puts @survey
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(params[:survey])
    @survey.user = current_user
    @survey.network = current_network

    if params[:delivery]
      params[:delivery][:course_ids].each do |id|
        @survey.courses.push(Course.find(id))
      end
    end

    respond_to do |format|
      if @survey.save!
        @az = @survey
        @publication = Wall.find_by_publication_type_and_publication_id("Survey",@survey.id)
        @typed = "Survey"
        activation_activity
        format.js
       # format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render json: @survey, status: :created, location: @survey }
      else
        format.html { render action: "new" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    params[:survey][:course_ids] ||= []
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
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

      if @user_survey.save
        params[:questions].each do |question|

          #
          # question[1] es el id de la respuesta
          # question[0] es la id de la pregunta
          #
          question[1].each do |answer|
            @user_response = UserSurveyResponse.new
            @user_response.user_survey_id = @user_survey.id
            @user_response.question_id = question[0]
            @user_response.answer_id = answer[1]
            @user_response.save

          end
            @az = @user_survey
            @typed = "User_survey"
            activation_activity
        end
      else
        #logica por que no se guardo
      end
      # Ejemplo de como usar la evaluation de un examen
      # evaluation(current_user,@user_survey.survey_id)
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
