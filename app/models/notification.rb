class Notification < ActiveRecord::Base
  #attr_accessible :notificator_id, :notificator_type, :user_id, :kind

  has_many :usernotificationings, :dependent => :destroy
  has_many :users, :through => :usernotificationings

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
    when "new_assignment_on_delivery"
      owner = self.notificator.delivery
      creator = self.notificator.user
    when "user_request_friendship"
      creator = self.notificator.friend
    when "user_accepted_friendship"
      creator = self.notificator.user
    end
=begin
    self.users.each do |user|
      count = user.notifications.where(:active => true).count
      notificator = self.notificator
      Thread.new {
        PrivatePub.publish_to("/notifications/"+user.id.to_s,
                           notification: self,
                           num: count,
                           notificator:notificator,
                           # creator: self.notificator.user||User.last,
                           creator: creator,
                           reciever: user,
                           owner: owner
                           )
      }
      # Thread.new {
      #     begin
      #       block.call
      #     rescue => ex
      #       logger.info ex
      #     ensure
      #       ActiveRecord::Base.connection.close
      #     end
      #   }      
      end
     ActiveRecord::Base.connection.close
=end
  end

end
