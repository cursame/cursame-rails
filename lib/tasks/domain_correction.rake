desc "Subdomain corregido"
task :subdomain_users => :environment do

  users = User.all

  # Obtenemos todos los usuarios que no esten confirmados

  puts "Comenzando el proceso...."

  a = Time.now
  users_mailers = Array.new

  users.each do |user|
    if !(user.confirmed?) then
      users_mailers.push(user)
    end
  end

  puts "Numero de usuarios a los que se les enviara el correo #{users_mailers.size.to_s}"

  users = users_mailers

  # Enviando su correo de confirmacion

  user_errors = Array.new

  count = 1

  users.each do |user|
    if (count >= 10954) then
      begin
        user.resend_confirmation_token
        print count.to_s + ", "
      rescue
        user_errors.push(user)
      end
      end
    count += 1
  end

  puts ""

  b = Time.now
  puts "Tiempo total de procesado: #{(b - a).to_s}"

  if (user_errors.size != 0) then
    puts "Usuarios que mandan error.."
    user_errors.each do |user|
      puts user.email
    end
  end

end
