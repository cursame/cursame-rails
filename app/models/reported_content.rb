class ReportedContent < ActiveRecord::Base
  attr_accessible :user_id, :network_id, :reportable_id, :reportable_type, :description

  belongs_to :reportable, polymorphic: true
  belongs_to :user
  belongs_to :network

  has_many :Notification, as: :notificator, dependent: :destroy

  validates_associated :user, :network, :reportable

  after_create do
    admin_users = self.network.users.keep_if{|x| x.admin?}
    Notification.create(:users => admin_users, :notificator => self, :kind => 'new_reported_content')
  end
end
