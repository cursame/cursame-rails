class Mesage < ActiveRecord::Base
	belongs_to :user
	belongs_to :channel


	after_create do
		users =  self.channel.users.reject{ |user| user.id == self.user_id }
		
		users.each do |user|			
		    PrivatePub.publish_to("/messages/notifications_user_"+user.id.to_s,
		       message: self,
		       sender: self.user,
		       reciever: user,
		       channel: self.channel
		    )
		end
  end
end
