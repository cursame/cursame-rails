class Role < ActiveRecord::Base
  has_many :role_id_and_permission_ids
  has_many :networks_users
end
