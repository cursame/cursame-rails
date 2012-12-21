class Course < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_many :surveys
end
