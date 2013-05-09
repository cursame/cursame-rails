task :limpiar_bd_primaria_pasteje => :environment do
	network = Network.find(2)
	network.comments.delete_all
	network.walls.delete_all
	
	network.users.each do |user|
		user.notifications.delete_all
	end
	
end