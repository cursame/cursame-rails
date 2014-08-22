class MembersInCourseCriterium < ActiveRecord::Base
  attr_accessible :evaluation_criterium_id, :members_in_course_id

  has_one :grade, as: :gradable, dependent: :destroy

  belongs_to :members_in_course
  validates  :members_in_course, presence: true

  belongs_to :evaluation_criterium
  validates  :evaluation_criterium, presence: true

  accepts_nested_attributes_for :grade

end
