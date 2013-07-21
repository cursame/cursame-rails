desc "Migracion de las Users"
task :migration_users => :environment do

  path = "public/imports/migracion_users.csv"

  count = 1

  a = Time.now
  puts "Procesando"

  CSV.foreach(path, headers: true) do |row|
    if ((count > 6265 and count < 6268) or (count > 9000)) then
      begin
        network = Network.find_by_subdomain(row["network"])
        if network.nil? then
          puts "No existe la network. " + "Correo " + row["email"]
        else
          role_id = Role.find_by_title(row["role"]).id
          network_id = network.id

          first_name = row["first_name"].nil? ? "" : row["first_name"]
          last_name = row["last_name"].nil? ? "" : row["last_name"]
          about_me = row["about_me"].nil? ? "" : row["about_me"]
          twitter_link = row["twitter_link"].nil? ? "" : row["twitter_link"]
          facebook_link = row["facebook_link"].nil? ? "" : row["facebook_link"]

          password = (0...8).map{(65+rand(26)).chr}.join

          user = User.create!(:email => row["email"], :first_name => first_name,
            :last_name => last_name, :about_me => about_me, :twitter_link => twitter_link,
            :facebook_link => facebook_link, :password => password)

          Permissioning.create!(:user_id => user.id, :role_id => role_id, :network_id => network_id)

          puts "Correo " + row["email"]
        end
      rescue
        puts "\nError Name: " + row["email"]
        puts "\nError Linea: " + count.to_s
      end
    end
    count += 1
  end
  puts ""

  b = Time.now

  puts "Tiempo de procesamiento: " + (b-a).to_s
  puts "Terminado"

end
