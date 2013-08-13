desc "Reset personal url"
task :reset_personal_url => :environment do
  a = Time.now
    User.all.each_with_index do |u,index|
      u.update_attributes(:personal_url =>  "user_#{u.id}")
      print  index.to_s + ", "
    end
  puts ""
  b = Time.now
  puts "Timpo total de la transaccion: " + (b - a).to_s
end