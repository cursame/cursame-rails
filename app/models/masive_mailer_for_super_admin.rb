class MasiveMailerForSuperAdmin < ActiveRecord::Base
	
	def  delayed_send_mailer(users)
         # users.each do |users|
          mail = Notifier.masive_mailer_for_super_admin(users, self)
          mail.deliver

          #puts "#{mail}"
         #end
       
	end

	handle_asynchronously :delayed_send_mailer, :priority => 20, :run_at => Proc.new{Time.zone.now}
end
