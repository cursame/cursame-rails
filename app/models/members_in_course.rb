class MembersInCourse < ActiveRecord::Base
  belongs_to :course, :dependent => :destroy
  belongs_to :user, :dependent => :destroy
  
end
