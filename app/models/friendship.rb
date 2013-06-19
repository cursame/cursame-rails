class Friendship < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  after_create do
    Notification.create(:notificator => self, :user_id => self.friend_id, :kind => "user_request_friendship",:active => true)
  end

  after_destroy do
    notifications = Notification.where(:notificator_type => self.class.to_s, :notificator_id => self.id)
    notifications.each do |x|
      x.destroy
    end
  end

  after_update do
    accepted = self.changes[:accepted]
    if (!accepted.nil?) then
      if (!accepted[0] and accepted[1]) then
        notification = Notification.find_by_user_id_and_notificator_type_and_notificator_id(self.user,"Friendship",self.id)
        if notification.nil? then
          Notification.create(:notificator => self, :user_id => self.friend, :kind => "user_accepted_friendship",:active => true)
        end
      end
    end
  end
end
