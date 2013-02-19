class Activity < ActiveRecord::Base
  attr_accessible :title, :activitye, :activitye_type, :address, :latitude, :longitude, :activitye_id, :ip_address
  geocoded_by :ip_address,
    :latitude => :latitude, :longitude => :longitude
  after_validation :geocode
 
  
  belongs_to :activitye, polymorphic: :true

end
