class UserProperty < ActiveRecord::Base
	belongs_to :user
	validates_associated :user

  PROPERTY = {
  	number_of_students: '47'
  }


end
