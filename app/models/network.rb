class Network < ActiveRecord::Base
  has_one :network_template
  has_and_belongs_to_many :users  
end
