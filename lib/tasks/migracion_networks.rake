desc "Migracion de las networks"
task :migration_networks => :environment do

  path = "public/imports/migracion_networks.csv"

  count = 1

  a = Time.now
  puts "Procesando"

  CSV.foreach(path, headers: true) do |row|
    begin
      if Network.find_by_subdomain(row["subdomain"]) then
        puts "Network Subdomain Repetido: " + row["subdomain"]
        puts "Network Name: " + row["name"]
      else
        Network.create!(:name => row["name"], :subdomain => row["subdomain"],
          :public_register => row["public_register"], :population => (row["population"] + 500),
          :free => false)
        puts "Network Name: " + row["name"] if (count == 1)
        print count.to_s + " "
      end
    rescue
      puts "\nError Name: " + row["name"]
      puts "\nError Linea: " + count.to_s
    end
    count += 1
  end
  puts ""

  b = Time.now

  puts "Tiempo de procesamiento: " + (b-a).to_s
  puts "Terminado"

end
