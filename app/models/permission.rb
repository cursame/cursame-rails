class Permission < ActiveRecord::Base
  has_many :role_id_and_permission_ids
end
