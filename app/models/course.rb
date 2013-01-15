class Course < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader
  has_many :members_in_courses 
  has_many :deliveries_courses
  has_many :deliveries, :through => :deliveries_courses
  has_many :surveys

  has_many :surveyings
  has_many :surveys, :through => :surveyings
end
