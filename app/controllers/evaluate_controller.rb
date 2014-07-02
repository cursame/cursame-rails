class EvaluateController < ApplicationController

  include CoursesUtils

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
      Date.today <= activity.end_date.to_date and activity.end_date.to_date <= Date.tomorrow.to_date
    end
    
    @tomorrow_activities = activities.clone.keep_if do 
      |activity|
      Date.tomorrow <= activity.end_date.to_date and activity.end_date.to_date <= (Date.tomorrow + 1.day)
    end

    @rest_of_activities = activities.clone.keep_if do
      |activity| 
      activity.end_date.to_date >= (Date.tomorrow + 1.day)
    end     
    
  end
  
  def course
    
  end
  
  def inactive
    
  end

  def course_inactive
    
  end

  def qualifying
    
  end

  def user_survey
  	
  end

  def assignment
  	
  end
end
