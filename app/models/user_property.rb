class UserProperty < ActiveRecord::Base
	belongs_to :user
	validates_associated :user
	validates :property, :value, :user_id, presence: true
  attr_accessible :property, :user_id, :value 

  PROPERTY = {
  	number_of_students: '47'
  }


end
