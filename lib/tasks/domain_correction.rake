desc "Subdomain corregido"
task :subdomain_users => :enviroment do

  users = User.all

  # Obtenemos todos los usuarios que no esten confirmados

  users_mailers = Array.new

  users.each do |user|
    if !(user.confirmed?) then
      users_mailers.push(user)
    end
  end

  # Revisamos su subdomain

  users = users_mailers

  users.each do |user|
    network = user.networks.last
    user.update_attributes(:subdomain => network.subdomain)
  end

  # Enviando su correo de confirmacion

  # users.each do |user|
  #  user.resend_confirmation_token
  # end

end
