class CourseIdCourseFileId < ActiveRecord::Base
  belongs_to :course
  belongs_to :course_file
end
