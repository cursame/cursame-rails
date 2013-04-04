class Group < ActiveRecord::Base

  has_many :members_in_group, :dependent => :destroy

  belongs_to :user

  validates_presence_of :name
  validates_presence_of :user_id

  attr_accessible :id, :user_id, :name, :description

  def members
    members = self.members_in_group
    users = members.map {
      |member|
      member.user
    }
    return users
  end

end
