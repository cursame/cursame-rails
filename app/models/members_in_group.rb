class MembersInGroup < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :group_id

  attr_accessible :id, :user_id, :group_id
end
