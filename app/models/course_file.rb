class CourseFile < ActiveRecord::Base
 # has_many :users
 #  has_many :courses
  
  mount_uploader :file, SimpleCoursesFiles
  
  #validates_presence_of :users
  #validates_presence_of :courses

  validates_presence_of :file  
end
