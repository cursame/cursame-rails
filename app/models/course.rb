class Course < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_many :surveys

  has_many :surveyings
  has_many :surveys, :through => :surveyings

end
