task :no_owner => :environment do
	@courses = Course.all
	@courses.each do |c|

       @member_in_course = MembersInCourse.where(course_id: c.id, owner: true, accepted: true)
       puts "este curso contiene #{@member_in_course.count} administradores"
       if @member_in_course.count == 0
       	
       	puts "por no contener adminsitradores el curso #{c.title} se elmina"
       	 c.destroy
      
       end
	end
end