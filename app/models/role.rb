class Role < ActiveRecord::Base
  has_many :networks_users

  #roles
  has_many :permissionings
  has_many :roles, :through => :permissionings
end
