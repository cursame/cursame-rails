desc "Destroy notifications"
task :destroy_notifications => :environment do
  notificator_type = ENV["NOTIFICATOR_TYPE"]
  notificator_id = ENV["NOTIFICATOR_ID"]
  a = Time.now
  notifications = Notification.where(:notificator_type => notificator_type, :notificator_id => notificator_id.to_i) 
  #ActiveRecord::Base.transaction do
    notifications.each do |notification|
      #notification.destroy
    end 
    #end
  b = Time.now
  puts "Timpo total de la transaccion: " + (b - a).to_s
end