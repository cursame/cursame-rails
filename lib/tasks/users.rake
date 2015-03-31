# encoding: UTF-8
namespace :users do

  desc "Creates a .cvs file with the users info from a network"
  task :network, [:subdomain] => :environment do |t, args|
    
    network = Network.find_by_subdomain(args.subdomain)
    File.open("#{network.subdomain}.csv", "w+") do |file|
      file.write("NOMBRE,CORREO,ROL,FECHA DE REGISTRO\n")
      network.users.each do |user|
        file.write "#{user.to_csv}"
      end
    end
  end
end
