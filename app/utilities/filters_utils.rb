# encoding: utf-8
module FiltersUtils

	def only_teachers
		if current_role == "student"
			redirect_to root_path, flash: { notice: t('.evaluate_controller.only_teachers') }
		end
	end

	def only_students
		if current_role != "student"
			redirect_to root_path, flash: { notice: "Estas intentando entrar en una sección solo para estudiantes." }
		end
	end

end
