class SurveysController < ApplicationController
  def index
  #  @course = Course.find()
    @surveys = Survey.all
    # @surveys = @course.surveys
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(params[:survey])
    @survey.courses.push(Course.last) #aqui deben de ir los cursos que se envien del front
    @survey.user = current_user
    respond_to do |format|
      if @survey.save
        @publication = Wall.find_by_publication_type_and_publication_id("Survey",@survey.id)
        format.js
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
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
      redirect_to @survey, :notice  => "Successfully updated survey."
    else
      render :action => 'edit'
    end
  end

  def survey_reply
    if user_signed_in?    
      @user_survey = UserSurvey.new
      @user_survey.survey_id = params[:survey_id]
      @user_survey.user = current_user
      @user_survey.result = 0;
      
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
            @user_response.answer_id = answer
            @user_response.save
            
          end        
        end
      else
        #logica por que no se guardo
      end
      calificar(current_user,@user_survey.survey_id)
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
  
  def calificar(user_id,survey_id)
    user_survey = UserSurvey.where(:user_id => user_id, :survey_id => survey_id)
    if (user_survey.size == 0) then
      # Logica de cuando no encontro ningun UserSurvey
      #
      raise
    else
      user_survey = user_survey.first_or_create
    end
    responses = UserSurveyResponse.where(:user_survey_id => user_survey.id)
    correct_answers = 0.0
    responses.each do |response|

      answer = Answer.find(response.answer_id)
      correct_answers += 1 if answer.correct 
    end
    user_survey.update_attributes(:result => (correct_answers/responses.size)*10)
  end
end
