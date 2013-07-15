task :migration => :environment do

  networks.each do |net|
    Network.create!(:name => net[:network], :subdomain => net[:subdomain], :public_register => net[:public_register], :population => net[:population]), :free => false)
  end

  users.each do |u|
    User.create!(:email => u[:email], :first_name => u[:first_name], :last_name => u[:last_name],
                :bios => u[:bios], :twitter_link => u[:twitter_link], :facebook_link => u[:facebook_link])
    network = Network.find_by_subdomain(u[:network])
  end
end