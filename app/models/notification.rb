class Notification < ActiveRecord::Base
  #attr_accessible :notificator_id, :notificator_type, :user_id, :kind

  belongs_to  :user
  belongs_to  :notificator, :polymorphic => true

  after_create do
   	PrivatePub.publish_to("/notifications/"+self.user.id.to_s, notification: self.(:include => [:user, :comments, :like_not_likes]''), num: self.user.notifications.count)
  end
end
