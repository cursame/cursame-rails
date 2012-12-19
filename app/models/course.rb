class Course < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
