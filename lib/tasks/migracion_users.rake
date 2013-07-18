desc "Migracion de las Users"
task :migration_users => :environment do

  path = "public/imports/migracion_users.csv"

  count = 1

  a = Time.now
  puts "Procesando"

  CSV.foreach(path, headers: true) do |row|
    if (count <= 5000) then
      begin
        network = Network.find_by_subdomain(row["network"])
        if network.nil? then
          puts "No existe la network. " + "Correo " + row["email"]
        else
          role_id = Role.find_by_title(row["role"]).id
          network_id = network.id

          user = User.create!(:email => row["email"], :first_name => row["first_name"],
            :last_name => row["last_name"], :about_me => row["about_me"],
            :twitter_link => row["twitter_link"], :facebook_link => row["facebook_link"])
          Permissioning.create!(:user_id => user.id, :role_id => role_id, :network_id => network_id)

          puts "Correo " + row["email"]
        end
      rescue
        puts "\nError Name: " + row["name"]
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
