class Notification < ActiveRecord::Base
  #attr_accessible :notificator_id, :notificator_type, :user_id, :kind

  has_many :usernotificationings, :dependent => :destroy
  has_many :users, :through => :usernotificationings

  belongs_to  :notificator, :polymorphic => true

  validates_presence_of :notificator_id
  validates_presence_of :notificator_type


  after_create do

    owner = nil
    creator=nil

    case self.kind
    when "user_comment_on_network"  #esta ya no sucede por que son muchos usuarios en la red
      owner = self.notificator.user
      creator = self.notificator.user
    when "user_comment_on_course"   #funcionando
      owner = self.notificator.commentable
      creator = self.notificator.user
    when "new_public_course_on_network" #esta ya no sucede
      owner = self.notificator.network
    when "new_delivery_on_course" #funcionando
      owner = self.notificator.courses[0]
    when "new_discussion_on_course" #funcionando
      owner = self.notificator
    when "new_survey_on_course" #funcionando
      owner = self.notificator.courses[0]
    when "new_assignment_on_delivery" #funcionando
      owner = self.notificator.delivery
      creator = self.notificator.user
    when "new_accomplishment_on_assignment" #funcionando
      owner = self.notificator
      creator = self.notificator.delivery.courses.first.members_in_courses.first
    when "user_request_friendship" #funcionando
      creator = self.notificator.friend
    when "user_accepted_friendship" #funcionando
      creator = self.notificator.user
    when "user_comment_on_discussion" #funcionando
    when "user_comment_on_comment" #
      owner = self.notificator.user
      creator = self.notificator.user
    when "user_comment_on_user" #funcionando
    when "user_comment_on_delivery" #funcionando  
    when "new_assignment_on_survey"
    when "course_expired"
    when "course_deactivated"
    end
    self.users.each do |user|
      count = user.notifications.where(:active => true).count
      notificator = self.notificator
        Thread.new {
          begin
            PrivatePub.publish_to("/notifications/"+user.id.to_s,
               notification: self,
               num: count,
               notificator:notificator,
               creator: creator,
               reciever: user,
               owner: owner
             )
          rescue => ex
          ensure
            ActiveRecord::Base.connection.close
          end
        }
    end
  end

end
