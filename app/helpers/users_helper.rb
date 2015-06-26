module UsersHelper
	def is_teacher
		current_user.teacher? || current_user.admin?
	end

	def is_student
		current_user.student?
	end
end
