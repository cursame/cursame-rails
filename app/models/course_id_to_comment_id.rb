class CourseIdToCommentId < ActiveRecord::Base
  belongs_to :course
  belongs_to :comment
end
