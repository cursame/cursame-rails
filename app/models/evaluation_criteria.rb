class EvaluationCriteria < ActiveRecord::Base
  belongs_to :evaluable, polymorphic: true
end