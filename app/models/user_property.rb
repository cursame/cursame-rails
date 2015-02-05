class UserProperty < ActiveRecord::Base
  attr_accessible :property, :user_id, :value
end
