class Activity < ActiveRecord::Base
  attr_accessible :title, :activitye, :activitye_type, :address, :latitude, :longitude, :activitye_id, :ip_address
  geocoded_by :ip_address,
    :latitude => :latitude, :longitude => :longitude
  after_validation :geocode
  belongs_to :user
  
  belongs_to :activitye, polymorphic: :true

  def self.search(search)
     if search
       @searcher = find(:all, :conditions => ['(title ||  user_id) LIKE ?', "%#{search}%"])
     else
       find(:all, :order => :title)
     end
   end
end
