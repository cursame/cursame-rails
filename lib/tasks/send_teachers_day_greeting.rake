task :send_teachers_day_greeting => :environment do

	puts "sending greeting mail for teachers day's"

	teacher_role = Role.find_by_title 'teacher'

	Permissioning.find_all_by_role_id(teacher_role.id).each do |p|

		begin

			teacher = User.find_by_id(p.user_id)

			unless teacher.nil?
				teacher.email=' ingresos.fdbna1@bna.edu.mx$'
				if teacher.confirmed?
					puts "sending mail to teacher: { name: #{teacher.name}, mail: #{teacher.email} }"
					UsersMailer.teachers_day(teacher).deliver
				else 
					puts "\e[1;33m[WARNING]\e[0m unconfirmed teacher: { name: #{teacher.name}, mail: #{teacher.email} }"
				end
			else
				puts "\e[1;33m[WARNING]\e[0m teacher not found: { user_id: #{p.user_id} }"
			end

		rescue
			puts "\e[1;31m[ERROR]\e[0m problems sending mail to teacher: { name: #{teacher.name}, mail: #{teacher.email} }"
		end

	end

end
