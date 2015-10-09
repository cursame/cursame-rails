class Permissioning < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :network

  validates_presence_of :user
  validates_presence_of :network
  validates_presence_of :role

  validates_associated :role
  validates_associated :network

  validates :entity_id, entity: true
  validates :entity_name, entity: true

  before_validation do |permissioning|
    network = Network.find_by_subdomain(permissioning.user.subdomain)

    if network
      permissioning.network_id = network.id
    end
  end
end
