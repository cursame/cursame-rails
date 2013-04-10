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
  end

  def activities
    @activities = Activity.search(params[:search])
    @ac = @activities.count
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
