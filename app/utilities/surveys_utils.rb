module SurveysUtils
	def student_lapsed_surveys
		courses = student_subscribed_courses

    surveys = courses.inject([]) do |accu, course|
     	accu + course.surveys
    end

    surveys = surveys.keep_if do |survey|
      survey.end_date.to_datetime < Time.now.to_datetime 
    end

    surveys.sort do |x,y|
    	y.end_date <=> x.end_date
    end    
	end

  def course_lapsed_surveys(course)
    surveys = course.surveys

    surveys = surveys.keep_if do |survey|
      survey.end_date.to_datetime < Time.now.to_datetime
    end

    surveys = surveys.sort do
      |x,y| y.end_date <=> x.end_date
    end
  end
end