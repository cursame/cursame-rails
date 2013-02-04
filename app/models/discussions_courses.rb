class DiscussionsCourses < ActiveRecord::Base
   belongs_to :course
   belongs_to :disscussion
end
