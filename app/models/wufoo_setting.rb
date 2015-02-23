class WufooSetting < ActiveRecord::Base
  belongs_to :network
  attr_accessible :subdomain, :api_key, :network_id
end
