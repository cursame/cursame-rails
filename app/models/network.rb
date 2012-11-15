class Network < ActiveRecord::Base
  has_one :network_template
  has_many :users_networks_networks_users, :dependent => :destroy

end
