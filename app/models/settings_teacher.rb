class SettingsTeacher < ActiveRecord::Base

  attr_accessible :limit_deliveries, :limit_surveys, :user_id, :count_deliveries,
  :count_surveys

  belongs_to :user

  def increment_surveys
    count = self.count_surveys
    limit = self.limit_surveys
    if (count + 1 == limit)
      self.update_attributes(:count_surveys => 0)
      mail = Notifier.send_limit_surveys(self.user)
      mail.deliver
    else
      self.update_attributes(:count_surveys => self.count_surveys + 1)
    end
  end

  def increment_deliveries
    count = self.count_deliveries
    limit = self.limit_deliveries
    if (count + 1 == limit)
      self.update_attributes(:count_deliveries => 0)
      mail = Notifier.send_limit_deliveries(self.user)
      mail.deliver
    else
      self.update_attributes(:count_deliveries => self.count_deliveries + 1)
    end
  end
end
