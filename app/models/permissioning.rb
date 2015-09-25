class Permissioning < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :network

  validates_associated :role
  validates_associated :network

  validates_presence_of :entity_id, :unless => lambda { self.role.title != "mentor_link" }
  validates_presence_of :entity_name, :unless => lambda { self.role.title != "mentor_link" }

  before_validation do |permissioning|
    network = Network.find_by_subdomain(permissioning.user.subdomain)

    if network
      permissioning.network_id = network.id
    end
  end
end
