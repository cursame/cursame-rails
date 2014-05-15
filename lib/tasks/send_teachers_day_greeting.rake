task :send_teachers_day_greeting => :environment do

	puts "sending greeting mail for teachers day's"

	teacher_role = Role.find_by_title 'teacher'

	Permissioning.find_all_by_role_id(teacher_role.id).each do |p|

		teacher = User.find_by_id(p.user_id)

		unless teacher.nil?
			if teacher.confirmed? 
				puts "sending mail to teacher: { name: #{teacher.name}, mail: #{teacher.email} }"
				UsersMailer.teachers_day(teacher).deliver
			else 
				puts "unconfirmed teacher: { name: #{teacher.name}, mail: #{teacher.email} }"
			end
		else
			puts "teacher not found: { user_id: #{p.user_id} }"
		end

	end

end
