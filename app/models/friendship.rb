class Friendship < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  before_destroy do
    notifications = Notification.where(:notificator_id => self.id, :notificator_type => "Friendship")

    notifications.each do
      |notification|
      notification.destroy
    end
  end

  after_create do
    Notification.create(:notificator => self, :users => [self.friend], :kind => 'user_request_friendship',:active => true)
  end

  after_update do
    accepted = self.changes[:accepted]
    if (!accepted.nil?) then
      if (!accepted[0] and accepted[1]) then
        notification = Notification.find_by_notificator_type_and_notificator_id_and_kind("Friendship",self.id,'user_accepted_friendship')
        if notification.nil? then
          Notification.create(:notificator => self, :users => [self.user], :kind => 'user_accepted_friendship',:active => true)
        end
      end
    end
  end
end
