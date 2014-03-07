class CourseFile < ActiveRecord::Base
 # has_many :users
  # has_many :courses
  
  mount_uploader :file, SimpleCoursesFiles
  
  has_many :course_id_course_file_id
  has_many :courses, :through => :course_id_course_file_id
  #validates_presence_of :users
  #validates_presence_of :courses

  # validates_presence_of :file  
end
