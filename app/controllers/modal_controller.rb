class ModalController < ApplicationController
  skip_before_filter :authenticate_user!, only: [ :landing_intro_video_modal ]

  def landing_intro_video_modal
    respond_to do |format|
      format.js
    end
  end

  def network_intro_video_modal
    respond_to do |format|
      format.js
    end
  end

  def teacher_quiz_modal
    respond_to do |format|
      format.js
    end
  end

  def student_quiz_modal
    respond_to do |format|
      format.js
    end
  end

  def set_password_modal
    respond_to do |format|
      format.js
    end
  end

  def delivery_modal
    @delivery = Delivery.find_by_id(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def survey_modal
    @survey = Survey.find_by_id(params[:id])
    time_trying_validate(@survey)
    respond_to do |format|
      format.js
    end
  end

  def discussion_modal
    @discussion = Discussion.find_by_id(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  def wufoo_form_modal
    @form = WufooForm.find_by_id(params[:id])
  end

  def reported_content_modal
    @type = params[:type]
    if params[:type] == 'wall'
      @content = Wall.find_by_id(params[:id])
    elsif params[:type] == 'comment'
      @content = Comment.find_by_id(params[:id])
    end
    respond_to do |format|
      format.js
    end 
  end

protected
 
  ########## this function call calculate the attem and the times (extract function) ######## 
  def time_trying_validate(survey)
   if current_user.student?
      time_trying_user_count = survey.time_trying_surveys.where(user_id: current_user.id).count
      if time_trying_user_count  == 0
       @time_trying_survey = TimeTryingSurvey.create(survey_id: survey.id, user_id: current_user.id, open_at: Time.now)
      end
      @count_tryings = time_trying_user_count + 1
    end
  end

end

