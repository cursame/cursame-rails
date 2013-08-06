desc "Subdomain corregido"
task :subdomain_users => :environment do

  users = User.all

  # Obtenemos todos los usuarios que no esten confirmados

  puts "Comenzando el proceso...."

  a = Time.now
  users_mailers = Array.new

  users.each do |user|
    #if !(user.confirmed?) then
      users_mailers.push(user)
    #end
  end

  #puts "Numero de usuarios a los que se les enviara el correo #{users_mailers.size.to_s}"
  # Revisamos su subdomain

  puts "Resolviendo el subdomain a todos los usuarios"
  users = users_mailers

  users.each do |user|
    network = user.networks.last
    user.update_attributes(:subdomain => network.subdomain)
  end

  b = Time.now
  puts "Tiempo total de procesado: #{(b - a).to_s}"
  # Enviando su correo de confirmacion

  # users.each do |user|
  #  user.resend_confirmation_token
  # end

end
