task :delete_duplicates => :environment do
	publications = Wall.where(:publication_type => "Comment")
	publications = publications + Wall.where(:publication_type => "Discussion")
	muros = []
	publications.each do |p|
		wall = Wall.find_by_publication_id_and_publication_type(p.publication_id, p.publication_type)
		if wall.publication_type == "Comment"
			if wall.publication.commentable_type == "Network"
				muros.push(wall)
			end
		end
		if wall.publication_type == "Discussion"
			muros.push(wall)
		end
	end

	muros.each do |muro|
		walls = Wall.where(:publication_id =>muro.publication_id,:publication_type =>muro.publication_type)
		puts walls.count.to_s
		walls = walls.reject{|wall| wall.id == muro.id}
		puts walls.count.to_s
		Wall.destroy walls.map { |w| w.id }
	end


end