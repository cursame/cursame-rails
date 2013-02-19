class Notification < ActiveRecord::Base
  #attr_accessible :notificator_id, :notificator_type, :user_id, :kind

  belongs_to  :user
  belongs_to  :notificator, :polymorphic => true

  after_create do

    owner = nil

    case self.kind
    when "user_comment_on_network"
    when "user_comment_on_course"
      owner = self.notificator.commentable
    when "new_delivery_on_course"
      owner = self.notificator.courses[0]
    when "new_public_course_on_network"
      owner = self.notificator.network
    when "new_survey_on_course"
      owner = self.notificator.courses[0]
    end

   	PrivatePub.publish_to("/notifications/"+self.user.id.to_s,
   		 notification: self, 
       num: self.user.notifications.count,
   		 notificator: self.notificator,
       # creator: self.notificator.user||User.last,
   		 creator: User.last,
   		 reciever: self.user,
   		 owner: owner
   	)
  end
end
