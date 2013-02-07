class NetworksUser < ActiveRecord::Base
  belongs_to :network
  belongs_to :user
end
