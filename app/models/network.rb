class Network < ActiveRecord::Base
  has_one :network_template
  has_many :users
  
end
