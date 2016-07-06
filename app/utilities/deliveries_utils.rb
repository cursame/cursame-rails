module DeliveriesUtils
	def student_lapsed_deliveries
		courses = student_subscribed_courses

    deliveries = courses.inject([]) do
      |accu, course|
      accu + course.deliveries
    end

    deliveries = deliveries.keep_if do |delivery|
      !delivery.end_date.nil? && delivery.end_date < DateTime.now
    end

    deliveries.sort do |x,y|
    	y.end_date <=> x.end_date
    end
	end

  def course_lapsed_deliveries(course)
    deliveries = course.deliveries

    deliveries = deliveries.keep_if do |delivery|
      !delivery.end_date.nil? && delivery.end_date < DateTime.now
    end

    deliveries.sort do
      |x,y| y.end_date <=> x.end_date
    end
  end
end
