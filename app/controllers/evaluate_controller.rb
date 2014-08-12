# coding: utf-8

class EvaluateController < ApplicationController
  include CoursesUtils
  include FiltersUtils
  before_filter :only_teachers

  def index
    courses = teacher_published_courses

    deliveries = courses.inject([]) do
      |accu, course|
      accu + course.deliveries
    end
    surveys = courses.inject([]) do
      |accu, course|
      accu + course.surveys
    end

    activities = (deliveries + surveys).sort do
      |x,y| y.end_date <=> x.end_date
    end

    @today_activities = activities.clone.keep_if do
      |activity|
      p activity
      Date.today <= activity.end_date.to_datetime and activity.end_date.to_datetime <= Date.tomorrow
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

  def course
    @course = Course.find_by_id(params[:id])
    redirect_to root_path, flash: { error: "Estas tratando de calificar un curso que no te pertenece."} unless @course.owner?(current_role, current_user)

    if @course.nil?
    end

    permissioning = Permissioning.find_by_user_id_and_network_id(current_user.id, current_network.id)

    if permissioning.nil?
    end


    if not(@course.owner?(permissioning.role.title, current_user))
    end

    activities = (@course.deliveries + @course.surveys).sort do
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
    courses = teacher_published_courses

    deliveries = courses.inject([]) do
      |accu, course|
      accu + course.deliveries
    end
    surveys = courses.inject([]) do
      |accu, course|
      accu + course.surveys
    end

    activities = (deliveries + surveys).sort do
      |x,y| y.end_date <=> x.end_date
    end

    @activities = activities.keep_if do
      |activity|
      activity.end_date.to_datetime < Date.today
    end
  end

  def course_inactive
    @course = Course.find_by_id(params[:id])
    redirect_to root_path, flash: { error: "Estas tratando de calificar un curso que no te pertenece."} unless @course.owner?(current_role, current_user)

    if @course.nil?
    end

    permissioning = Permissioning.find_by_user_id_and_network_id(current_user.id, current_network.id)

    if permissioning.nil?
    end


    if not(@course.owner?(permissioning.role.title, current_user))
    end

    activities = (@course.deliveries + @course.surveys).sort do
      |x,y| y.end_date <=> x.end_date
    end

    @activities = activities.clone.keep_if do
      |activity|
      activity.end_date.to_datetime < Date.today
    end
  end

  def qualifying
    @survey = Survey.find_by_id(params[:survey_id])
    @delivery = Delivery.find_by_id(params[:delivery_id])

    if @survey
      owner = @survey.owner?(current_role, current_user)
    elsif @delivery
      owner = @delivery.owner?(current_role, current_user)
    end

    redirect_to root_path, flash: { error: "Estas tratando de ver una actividad que no te pertenece."} unless owner
  end

  def discussion
    @discussion = Discussion.find_by_id(params[:discussion_id])
    redirect_to root_path, flash: { error: "La discusión que intentas ver no existe o ah sido borrada."} and return if @discussion.nil?
    redirect_to root_path, flash: { error: "Estas tratando de ver una actividad que no te pertenece."} and return unless @discussion.owner?(current_role, current_user)
    redirect_to root_path, flash: { error: "La discusión que intentas ver no es calificable."} and return unless @discussion.evaluable

    respond_to do |format|
      format.html { render 'evaluate/discussion/evaluate_discussion' }
    end
  end

  def discussion_response
    
  end

  def user_survey
    @user_survey = UserSurvey.find_by_id(params[:id])
    redirect_to root_path, flash: { error: "Estas tratando de ver una actividad que no te pertenece."} unless @user_survey.survey.owner?(current_role, current_user)
  end

  def response_user_survey

    feedback = params[:feedback]
    
    user_survey_id = params[:id]
    user_survey = UserSurvey.find_by_id(user_survey_id)
    user_survey.grade.update_attributes(feedback: feedback)

    Notification.create(:users => [user_survey.user], :notificator => user_survey.grade, :kind => 'feedback_on_user_survey')

    respond_to do |format|
      format.html {
        redirect_to evaluate_survey_response_path(user_survey_id), flash: { success: "Comentario enviado correctamente."}
      }
    end

  end

  def assignment
    @assignment = Assignment.find_by_id(params[:id])
    redirect_to root_path, flash: { error: "Estas tratando de ver una actividad que no te pertenece."} unless @assignment.delivery.owner?(current_role, current_user)
  end

end
