desc "Reenviando correos"
task :resend => :environment do

  puts "Preprocesado:"
  a = Time.now

  networks = Network.where(["created_at > ?", "2013-07-18 00:00:00 -0500".to_time])

  users = Array.new

  networks.each do |net|
    if !net.users.nil? then
      users = users + net.users
    end
  end

  users.uniq!

  users = users.sort{ |x,y| x.email <=> y.email }

  puts "Preposcesado Terminado"
  b = Time.now
  puts "Tiempo total de preprocesado: " + (b-a).to_s

  puts "Procesando correos:"

  a = Time.now

  count = 1

  o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten

  users.each do |user|
    #if (count > 7081) then
      #user.resend_confirmation_token
      #
    #end
    string  =  (0...50).map{ o[rand(o.length)] }.join
    user.personal_url = string
    user.save!
    print count.to_s + " "
    count += 1
  end
  puts ""

  b = Time.now

  puts "Terminado"
  puts "Tiempo total:" + (b-a).to_s

end
