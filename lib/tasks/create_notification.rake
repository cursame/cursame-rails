desc "Create notifications"
task :create_notifications => :environment do
  notificator_type = ENV["NOTIFICATOR_TYPE"]
  notificator_id = ENV["NOTIFICATOR_ID"]
  notification_kind = ENV["NOTIFICATION_KIND"]
  users = ENV["USERS_ID"][1...-1].split(",").map{|s| s.to_i}
  
  a = Time.now
  ActiveRecord::Base.transaction do
    users.each do |id|
      Notification.create(:user_id => id, :notificator_type => notificator_type,
                          :notificator_id => notificator_id,:kind => notification_kind)
    end
  end
  b = Time.now
  puts "Tiempo total de la transaccion: " + (b - a).to_s
  
end