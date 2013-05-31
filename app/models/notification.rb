class Notification < ActiveRecord::Base
  #attr_accessible :notificator_id, :notificator_type, :user_id, :kind

  belongs_to  :user
  belongs_to  :notificator, :polymorphic => true

  after_create do

    owner = nil
    creator=nil

    case self.kind
    when "user_comment_on_network"
      owner = self.notificator.user
      creator = self.notificator.user
    when "user_comment_on_course"#---
      owner = self.notificator.commentable
      creator = self.notificator.user
    when "new_delivery_on_course"
      owner = self.notificator.courses[0]
    when "new_public_course_on_network"
      owner = self.notificator.network
    when "new_survey_on_course"#---
      owner = self.notificator.courses[0]
    when "user_comment_on_comment"#---
      owner = self.notificator.user
      creator = self.notificator.user
    end

    case self.kind
    when "user_comment_on_comment"
      creator = self.notificator.user
    when "user_comment_on_course"
      creator = self.notificator.user
    else
      creator = nil
    end

    if !creator.nil? then
      if creator.first_name.nil? then
        creator.first_name = "Unknown"
      end
      if creator.last_name.nil? then
        creator.last_name = "Unknown"
      end
    end

    PrivatePub.publish_to("/notifications/" + self.user.id.to_s,
       notification: self,
       num: self.user.notifications.where(:active => true).count,
       notificator: self.notificator,
       # creator: self.notificator.user||User.last,
       creator: creator,
       reciever: self.user,
       owner: owner
    )
  end
end
