class Group < ActiveRecord::Base

  has_many :members_in_group, :dependent => :destroy

  has_many :grouppublicationings
  has_many :wall, :through => :grouppublicationings

  belongs_to :user

  validates_presence_of :name
  validates_presence_of :user_id

  attr_accessible :id, :user_id, :name, :description

  #comentarios para los grupos de amigos
  acts_as_commentable

  def members
    members = self.members_in_group
    users = members.map {
      |member|
      member.user
    }
    return users
  end

  def users
    return self.members
  end

end
