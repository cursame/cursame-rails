desc "Subdomain corregido"
task :subdomain_users => :environment do

  users = User.all

  # Obtenemos todos los usuarios que no esten confirmados

  puts "Comenzando el proceso...."
=begin
  a = Time.now
  users_mailers = Array.new

  users.each do |user|
    if !(user.confirmed?) then
      users_mailers.push(user)
    end
  end

  puts "Numero de usuarios a los que se les enviara el correo #{users_mailers.size.to_s}"
  # Revisamos su subdomain

  users = users_mailers

  b = Time.now
  puts "Tiempo total de procesado: #{(b - a).to_s}"
=end

  # Pruebas

  users = ["jose_alfredo@cursa.me", "leon@cursa.me", "jose_alfredo+pi@cursa.me", "jose_alfredo+stuti1@cursa.me", "jose_alfredo+pi2@cursa.me",
           "jemiliano.cabrera@gmail.com", "emiliano@cursa.me", "gerrysbq28@gmail.com", "iam@armando.mx", "armando@codetlan.com", "armando@cursa.me"]


  users_class = users.map{|x| User.find_by_email(x)}

  users_class.each do |user|
    if !(user.nil?) then
      user.destroy
    end
  end

  num = rand(1050)
  users.each do |user|
    User.create!(:password => "123456", :email => user, :personal_url => num.to_s, :subdomain => "pruebas")
    num = num.succ
  end

  users_class = users.map{|x| User.find_by_email(x)}

  users_class.each do |user|
    user.resend_confirmation_token
  end

  # Enviando su correo de confirmacion

  # users.each do |user|
  #  user.resend_confirmation_token
  # end

end
