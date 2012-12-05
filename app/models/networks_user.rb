class NetworksUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :network
  belongs_to :role
end
