class NetworkSetting < ActiveRecord::Base
  attr_accessible :network_id, :property_field, :value

  belongs_to :network

  @@property = {:hasCourse => 'curso', :hasGroup => 'false'}

  def self.getProperty
  	@@property
  end
end
