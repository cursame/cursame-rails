class Notification < ActiveRecord::Base
  #attr_accessible :notificator_id, :notificator_type, :user_id, :kind

  belongs_to  :user
  belongs_to  :notificator, :polymorphic => true

  after_create do

   	PrivatePub.publish_to("/notifications/"+self.user.id.to_s,
   		 notification: self, num: self.user.notifications.count,
   		 notificator: self.notificator,
   		 creator: self.notificator.user,
   		 reciever: self.user
   		 # ,
   		 # owner: self.notificator.commentable
   	)
  end
end
