task :limpiar_bd_primaria_pasteje => :environment do
	network = Network.find(2)
	network.comments.delete_all
	network.walls.delete_all
	network.notifications.delete_all
end