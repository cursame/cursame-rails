class WufooSetting < ActiveRecord::Base
  belongs_to :network
  attr_accessible :acount_name, :api_key, :network_id
end
