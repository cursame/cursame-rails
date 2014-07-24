# encoding: utf-8

module FiltersUtils

	def only_teachers
		if current_role != "teacher"
			redirect_to root_path, flash: { notice: "No tienes permisos para entrar en esta sección." }
		end
	end

	def only_students
		if current_role != "student"
			redirect_to root_path, flash: { notice: "No tienes permisos para entrar en esta sección." }
		end
	end

end