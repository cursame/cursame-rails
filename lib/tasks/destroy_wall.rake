desc "Destroy Walls"
task :destroy_walls => :environment do
  a = Time.now
  publication_type = ENV["PUBLICATION_TYPE"]
  publication_id = ENV["PUBLICATION_ID"]
  walls = Wall.where(:publication_type => publication_type, :publication_id => publication_id.to_i)
  
  #ActiveRecord::Base.transaction do
    walls.each do |wall|
      #wall.destroy
    end
    #end
  b = Time.now
  puts "Timpo total de la transaccion: " + (b - a).to_s
end