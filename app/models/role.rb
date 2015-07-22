class Role < ActiveRecord::Base
  has_many :networks_users
  has_many :permissionings
  has_many :roles, through: :permissionings

  accepts_nested_attributes_for :permissionings

  def self.superadmin
    self.find_by_title "superadmin"
  end

  def self.admin
    self.find_by_title "admin"
  end

  def self.operator
    self.find_by_title "operator"
  end

  def self.mentor_link
    self.find_by_title "mentor_link"
  end

  def self.teacher
    self.find_by_title "teacher"
  end

  def self.student
    self.find_by_title "student"
  end


end
