class EvaluationCriterium < ActiveRecord::Base
  belongs_to :evaluable, polymorphic: true
  has_many :members_in_course_criteria, dependent: :destroy
  validates :name, presence: true
end