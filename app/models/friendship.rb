class Friendship < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  after_create do
    Notification.create(:notificator => self, :users => [self.friend], :kind => "user_request_friendship",:active => true)
  end

  after_update do
    accepted = self.changes[:accepted]
    if (!accepted.nil?) then
      if (!accepted[0] and accepted[1]) then
        notification = Notification.find_by_notificator_type_and_notificator_id("Friendship",self.id)
        if notification.nil? then
          Notification.create(:notificator => self, :users => [self.user], :kind => "user_accepted_friendship",:active => true)
        end
      end
    end
  end
end
