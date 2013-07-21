task :migration => :environment do

  path = "public/imports/migracion_networks.csv"

  count = 1

  a = Time.now

  CSV.foreach(path, headers: true) do |row|
    begin
      Network.create!(:name => row["name"], :subdomain => row["subdomain"],
        :public_register => row["public_register"], :population => (row["population"] + 500),
        :free => false)
      count += 1
      puts "Network Name: " + row["name"] if (count == 1)
      print "Linea: " + count.to_s + " "
    rescue
      puts "\nError Name: " + row["name"]
      puts "\nError Linea: " + count.t_s
    end
  end
  puts ""

  b = Time.now

  puts "Tiempo de procesamiento: " + (b-a).to_s

end
