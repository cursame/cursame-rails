class EvaluationCriterium < ActiveRecord::Base
  belongs_to :evaluable, polymorphic: true
  validates :name, presence: true

end