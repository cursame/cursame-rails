# coding: utf-8

class EvaluateController < ApplicationController
  include CoursesUtils
  include FiltersUtils
  before_filter :only_teachers

  include BitUtils
  rescue_from Errors::ErrorResponseAppBit, with: :error_connection

  def index

    if current_user.teacher?
      courses = teacher_published_courses
    else
      courses = current_network.courses
    end

    deliveries = courses.inject([]) do
      |accu, course|
      accu + course.deliveries
    end

    surveys = courses.inject([]) do
      |accu, course|
      accu + course.surveys
    end

    discussions = courses.inject([]) do
      |accu, course|
      tmp_array_discussions = course.discussions.select do
        |discussion| discussion.evaluable?
      end
      accu + tmp_array_discussions
    end

    activities = (deliveries + surveys + discussions).sort do
      |x,y| x.publish_date <=> y.publish_date
    end

    @today_activities = []
    @tomorrow_activities = []
    @rest_of_activities = []

    activities.each do |activity|
      if activity.end_date.nil? || Date.tomorrow < activity.end_date.to_date
        @rest_of_activities << activity
      elsif Date.tomorrow == activity.end_date.to_date
        @tomorrow_activities << activity
      elsif DateTime.now < activity.end_date
        @today_activities << activity
      end
    end
  end

  def course
    @course = Course.find_by_id(params[:id])
    redirect_to root_path, flash: { error: t('.evaluate_controller.no_evaluate')} unless @course.owner?(current_role, current_user)

    discussions = @course.discussions.select do
      |discussion| discussion.evaluable?
    end

    activities = (@course.deliveries + @course.surveys + discussions).sort do
      |x,y| y.end_date <=> x.end_date
    end

    @today_activities = activities.clone.keep_if do
      |activity|
      Date.today <= activity.end_date.to_datetime and activity.end_date.to_datetime <= Date.tomorrow.to_date
    end

    @tomorrow_activities = activities.clone.keep_if do
      |activity|
      Date.tomorrow <= activity.end_date.to_datetime and activity.end_date.to_datetime <= (Date.tomorrow + 1.day)
    end

    @rest_of_activities = activities.clone.keep_if do
      |activity|
      activity.end_date.to_datetime >= (Date.tomorrow + 1.day)
    end
  end

  def inactive
    if current_user.teacher?
      courses = teacher_published_courses
    else
      courses = current_network.courses
    end

    deliveries = courses.inject([]) do
      |accu, course|
      accu + course.deliveries
    end

    surveys = courses.inject([]) do
      |accu, course|
      accu + course.surveys
    end

    discussions = courses.inject([]) do
      |accu, course|
      tmp_array_discussions = course.discussions.select do
        |discussion| discussion.evaluable?
      end
      accu + tmp_array_discussions
    end

    activities = (deliveries + surveys + discussions).keep_if do |activity|
      !activity.end_date.nil? && activity.end_date < DateTime.now
    end

    @activities = activities.sort do |x,y|
      y.end_date <=> x.end_date
    end
  end

  def course_inactive
    @course = Course.find_by_id(params[:id])
    redirect_to root_path, flash: { error: t('.evaluate_controller.no_evaluate')} unless @course.owner?(current_role, current_user)

    discussions = @course.discussions.select do
      |discussion| discussion.evaluable?
    end

    activities = (@course.deliveries + @course.surveys + discussions).sort do
      |x,y| y.end_date <=> x.end_date
    end

    @activities = activities.clone.keep_if do
      |activity|
      activity.end_date.to_datetime < Date.today
    end
  end

  def delivery
    @delivery = Delivery.find_by_id(params[:delivery_id])

    user_delivery = @delivery.user
    course_delivery = @delivery.courses.first
    unless user_delivery.admin? and course_delivery.owner?(current_role, current_user)
      redirect_to root_path, flash: { error: t('.evaluate_controller.no_activity')} and return unless @delivery.owner?(current_role, current_user)
    end

    respond_to do |format|
      format.html { render 'evaluate/deliveries/evaluate_deliveries' }
    end
  end

  def delivery_response
    @assignment = Assignment.find_by_id(params[:id])

    user_delivery = @assignment.delivery.user
    course_delivery = @assignment.delivery.courses.first
    unless user_delivery.admin? and course_delivery.owner?(current_role, current_user)
    redirect_to root_path, flash: { error: t('.evaluate_controller.no_activity')} and return unless @assignment.delivery.owner?(current_role, current_user)
    end

    unless @assignment.grade.present?
      @assignment.build_grade
    end

    if @assignment.delivery.evaluation_criteria.count > 0 && @assignment.response_to_the_evaluations.empty?
      @assignment.delivery.evaluation_criteria.count.times { @assignment.response_to_the_evaluations.build }
    end

    respond_to do |format|
      format.html { render 'evaluate/deliveries/delivery_user_response' }
    end
  end

  def survey
    @survey = Survey.find_by_id(params[:survey_id])

    user_survey = @survey.user
    course_survey = @survey.courses.first
    unless user_survey.admin? and course_survey.owner?(current_role, current_user)
      redirect_to root_path, flash: { error: t('.evaluate_controller.no_activity')} and return unless @survey.owner?(current_role, current_user)
    end

    respond_to do |format|
      format.html { render 'evaluate/surveys/evaluate_surveys' }
    end
  end

  def survey_attemps
    @survey = Survey.find(params[:survey_id])
  end

  def survey_response
    @user_survey = UserSurvey.find_by_id(params[:id])

    user_survey = @user_survey.survey.user
    course_survey = @user_survey.survey.courses.first
    unless user_survey.admin? and course_survey.owner?(current_role, current_user)
      redirect_to root_path, flash: { error: t('.evaluate_controller.no_activity')} and return unless @user_survey.survey.owner?(current_role, current_user)
    end

    respond_to do |format|
      format.html { render 'evaluate/surveys/survey_user_response' }
    end
  end

  def response_user_survey
    feedback = params[:feedback]
    user_survey_id = params[:id]
    user_survey = UserSurvey.find_by_id(user_survey_id)
    user_survey.grade.update_attributes(feedback: feedback)

    Notification.create(:users => [user_survey.user], :notificator => user_survey.grade, :kind => 'feedback_on_user_survey')

    respond_to do |format|
      format.html {
        redirect_to evaluate_survey_response_path(user_survey_id), flash: { success: t('.evaluate_controller.send_comment')}
      }
    end
  end

  def discussion
    @discussion = Discussion.find_by_id(params[:discussion_id])
    redirect_to root_path, flash: { error: t('.evaluate_controller.no_exist')} and return if @discussion.nil?

    user_discussion = @discussion.user
    course_discussion = @discussion.courses.first
    unless user_discussion.admin? and course_discussion.owner?(current_role, current_user) #profesor puede ver discusiones creadas por el admin de red
      redirect_to root_path, flash: { error: t('.evaluate_controller.no_activity')} and return unless @discussion.owner?(current_role, current_user)
    end

    redirect_to root_path, flash: { error: t('.evaluate_controller.no_calificable')} and return unless @discussion.evaluable

    respond_to do |format|
      format.html { render 'evaluate/discussions/evaluate_discussions' }
    end
  end

  def discussion_response
    @discussion_response = DiscussionResponse.find_by_id(params[:id])

    user_discussion = @discussion_response.discussion.user
    course_discussion = @discussion_response.discussion.courses.first
    unless user_discussion.admin? and course_discussion.owner?(current_role, current_user) #profesor puede ver discussion-response de discusiones creadas por el admin de red
      redirect_to root_path, flash: { error: t('.evaluate_controller.no_activity')} and return unless @discussion_response.discussion.owner?(current_role, current_user)
    end

    unless @discussion_response.grade.present?
      @discussion_response.build_grade
    end

    if @discussion_response.discussion.evaluation_criteria.count > 0 && @discussion_response.response_to_the_evaluations.empty?
      @discussion_response.discussion.evaluation_criteria.count.times { @discussion_response.response_to_the_evaluations.build }
    end

    respond_to do |format|
      format.html { render 'evaluate/discussions/discussion_user_response' }
    end
  end

  def discussion_rate
    @discussion_response = DiscussionResponse.find_by_id(params[:id])

    if  @discussion_response.update_attributes params[:discussion_response]
      sending_grade_discussion_to_bit(@discussion_response) unless @discussion_response.discussion.evaluation_period_id.nil?
      Notification.create users: [@discussion_response.user], notificator: @discussion_response.grade, kind: 'new_score_on_discussion_response'
      redirect_to evaluate_discussion_response_path(@discussion_response), flash: { success: t('.evaluate_controller.correct') }
    else
      redirect_to evaluate_discussion_response_path(@discussion_response), flash: { error: t('.evaluate_controller.error') }
    end
  end

  def error_connection
    info_flash = { error: "Ocurrio un error, No se pudo enviar la informacion a Bit." }
    redirect_to :back, flash: info_flash
  end
end
