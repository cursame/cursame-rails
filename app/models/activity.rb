class Activity < ActiveRecord::Base
  
  belongs_to :activitye, polymorphic: :true
 
end
