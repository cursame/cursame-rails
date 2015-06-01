class BitSetting < ActiveRecord::Base
  belongs_to :network
  attr_accessible :authorization_keyword, :api_key, :network_id
end