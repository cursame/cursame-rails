class Role < ActiveRecord::Base
  has_many :networks_users
  has_many :permissionings
  has_many :roles, through: :permissionings

  accepts_nested_attributes_for :permissionings

  ADMIN   = Role.find(1)
  STUDENT = Role.find(2)
  TEACHER = Role.find(3)
  SUPERADMIN = Role.find(4)
  OPERATOR = Role.find_by_title "operator"
  MENTOR_LINK = Role.find_by_title "mentor_link"
end
