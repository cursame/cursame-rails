class DiscussionsCourses < ActiveRecord::Base
   belongs_to :course
   belongs_to :discussion
end
