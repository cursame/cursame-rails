class Role < ActiveRecord::Base
  has_many :networks_users

  #roles
  has_many :permissionings
  has_many :roles, :through => :permissionings
  
  accepts_nested_attributes_for :permissionings
  
end
