task :avatar_nil => :environment do
users = User.where(:avatar => nil)
users.each do |u|
  u.avatar = '/assets/imagex.png'
  u.save!
  if u.save 
    puts "se ha guardado el avatar"
  end
end  
end
      