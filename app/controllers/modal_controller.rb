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
    @count_tryings = time_trying_validate(@survey)
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

  def time_trying_validate(survey)
    time_trying_user_count = survey.time_trying_surveys.where(user_id: current_user.id).count
    if current_user.student?
      if time_trying_user_count  == 0
        count_tryings = time_trying_user_count + 1
        @time_trying_survey = TimeTryingSurvey.create(survey_id: survey.id, user_id: current_user.id, open_at: Time.now)
      end
    else
      count_tryings = time_trying_user_count + 1
    end
    count_tryings
  end

end

