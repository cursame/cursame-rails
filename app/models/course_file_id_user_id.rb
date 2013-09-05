class CourseFileIdUserId < ActiveRecord::Base
  belongs_to :course_file
  belongs_to :user
end
