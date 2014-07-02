class EvaluateController < ApplicationController

  include CoursesUtils

  def index
    courses = teacher_published_courses
    
    deliveries = courses.inject([]) do
      |accu, course| 
      accu + course.deliveries.where("end_date >= ?", Date.today)
    end
    surveys = courses.inject([]) do
      |accu, course| 
      accu + course.surveys.where("end_date >= ?" , Date.today)
    end
    
    activities = (deliveries + surveys).sort do 
      |x,y| y.end_date <=> x.end_date
    end
    
    @today_activities = activities.drop_while{ |activity| activity.end_date >= Date.tomorrow }
    @tomorrow_activities = activities.keep_if do 
      |activity|
      Date.tomorrow <=activity.end_date and activity.end_date <= (Date.tomorrow + 1.day)
    end

    @rest_of_activities = activities.take_while { |activity| activity.end_date >= (Date.tomorrow + 1.day)}     
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
