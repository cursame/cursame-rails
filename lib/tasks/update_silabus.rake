task :add_silabus => :environment do
	courses  = Course.where(:network_id =>6)

	courses.each do |c|
		c.silabus = '...'
		c.save
	end
end