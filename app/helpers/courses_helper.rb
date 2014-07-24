module CoursesHelper
	include CoursesUtils
	
	def student_courses
		student_subscribed_courses
	end

	def teacher_courses
		teacher_published_courses
	end
end