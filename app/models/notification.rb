class Notification < ActiveRecord::Base
  #attr_accessible :notificator_id, :notificator_type, :user_id, :kind

  belongs_to  :user
  belongs_to  :notificator, :polymorphic => true

  after_create do

    owner = nil

    if self.kind == "user_comment_on_network"
      owner = self.notificator.commentable
    end

   	PrivatePub.publish_to("/notifications/"+self.user.id.to_s,
   		 notification: self, num: self.user.notifications.count,
   		 notificator: self.notificator,
   		 creator: self.notificator.user,
   		 reciever: self.user,
   		 owner: owner
   	)
  end
end
