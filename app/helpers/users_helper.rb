module UsersHelper
	def is_teacher
		current_role == 'teacher' ? true : false
	end

	def is_student
		current_role == 'student' ? true : false
	end
end
