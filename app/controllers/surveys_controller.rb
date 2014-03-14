class SurveysController < ApplicationController
  def index
  #  @course = Course.find()
    @surveys = Survey.all
    # @surveys = @course.surveys
  end

  def my_surveys
    surveys = []
      current_user.courses.each do |c|
        @member = MembersInCourse.find_by_course_id_and_user_id(c.id,current_user.id)
         c.surveys.each do |s|
           case 
              when @member.owner
                  if s.user_surveys.count == 0
                       surveys.push(s.id)
                  end
              when (!@member.owner.nil? || !@member.owner)
                  if s.user_surveys.count == 0
                       surveys.push(s.id)
                      else
                      if s.user_suerveys.where(:user_id => current_user).count == 0
                        surveys.push(s.id)
                      end
                  end
           end
          end
      end
    @wall = current_network.walls.where(:publication_type => 'Survey', :publication_id => surveys ).paginate(:per_page => 15, :page => params[:page]).order('created_at DESC')
  end

  def show
    @survey = Survey.find(params[:id])
    puts @survey
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.create(params[:survey])
    @survey.user = current_user
    @survey.network = current_network

    courses = params[:delivery] ? params[:delivery]["course_ids"] : nil

    if courses && !courses.empty?
      courses.each do |id|
        @survey.courses.push(Course.find(id))
      end
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
      @linkik = 'Despublicar'

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
