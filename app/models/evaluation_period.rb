class EvaluationPeriod < ActiveRecord::Base
  attr_accessible :course_id, :name, :order, :short_name

  belongs_to :course
  validates_associated :course, presence: true
end
