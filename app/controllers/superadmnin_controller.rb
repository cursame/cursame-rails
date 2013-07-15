class SuperadmninController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:instructions]
  #skip_before_filter :authenticate_user!, :only => [:create_super_admin]
  #skip_before_filter :require_no_authentication, :only => [:create_super_admin]

  #filter_access_to :all

  layout 'super_admin'
  def statistics
    @activities = Activity.find(:all, :order => "created_at")
    @events = Event.all
    @deliverys = Delivery.all
    @assignments = Assignment.all
    @survey = Survey.all
    @user_survey_response = UserSurveyResponse.all

   @agroup_activities_by_date = Activity.order("DATE(created_at)").group("DATE(created_at)").count
   @agroup_deliveries_by_date = Delivery.order("DATE(created_at)").group("DATE(created_at)").count
   @agroup_assignments_by_date = Assignment.order("DATE(created_at)").group("DATE(created_at)").count
   @agroup_survey_by_date = Survey.order("DATE(created_at)").group("DATE(created_at)").count
   @agroup_user_survey_response_by_date = UserSurveyResponse.order("DATE(created_at)").group("DATE(created_at)").count
   @agroup_event_by_date = Event.order("DATE(created_at)").group("DATE(created_at)").count





  end

  def networks
  end

  def users
    @users = User.search(params[:search])
    @user_count = @users.count
  end

  def activities
    @activities = Activity.search(params[:search])
    @ac = @activities.count

    @ac_delivery = Activity.where(:activitye_type => 'Delivery').count
    @ac_survey =  Activity.where(:activitye_type => 'Survey').count
    @ac_assignment = Activity.where(:activitye_type => 'Assignment').count
    @ac_comment =  Activity.where(:activitye_type => 'Comment').count
    @ac_courses =  Activity.where(:activitye_type => 'Course').count
    @ac_user_survey =  Activity.where(:activitye_type => 'User_survey').count

    ### promedio de calificación por usuario

        #### promedios de calificación por tarea
        @acomplishment_sum = Assignment.sum(:accomplishment)
        @prompt_calification_by_delivery = ( @acomplishment_sum.to_f / @ac_delivery.to_f ).to_f

        #### promedio de calificación por examen

        @result_sum = UserSurvey.sum(:result)
        @prompt_calification_by_survey = ( @result_sum.to_f / @ac_survey.to_f ).to_f

        ### promedio por alumnos

        @sum_promts =  @prompt_calification_by_delivery +   @prompt_calification_by_survey
        @users= User.all
        @users_count = @users.count
        @user_promt = (@sum_promts.to_f/ @users_count.to_f).to_f

  end

  def roles
  end

  def create_super_admin
  end

  def courses_sintetic_view_and_edit
    @courses = Course.all
  end

  def publicity_modul_controller
  end

  def instructions
  end


end
