class EvaluationPeriod < ActiveRecord::Base
  attr_accessible :course_id, :name, :order, :short_name, :deliveries,
                  :surveys, :discussions, :evaluation_criteria_attributes

  belongs_to :course
  validates_associated :course

  has_many :evaluation_criteria, as: :evaluable, dependent: :destroy
  has_many :surveys, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :discussions, dependent: :destroy

  accepts_nested_attributes_for :evaluation_criteria, allow_destroy: true

  def new_evaluation_criteria
    if evaluation_criteria.blank?
      EvaluationCriterium.create(name: 'cursame_deliveries', evaluable: self, evaluation_percentage: 0)
      EvaluationCriterium.create(name: 'cursame_surveys', evaluable: self, evaluation_percentage: 0)
      EvaluationCriterium.create(name: 'cursame_discussions', evaluable: self, evaluation_percentage: 0)
    end
  end
end
