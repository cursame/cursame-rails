class DiscussionCourse < ActiveRecord::Base
   belongs_to :course
   belongs_to :discussion, dependent: :destroy
end
