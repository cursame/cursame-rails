class NetworkSetting < ActiveRecord::Base
  attr_accessible :network_id, :property, :value

  belongs_to :network
end
