
class EvaluationCriterium < ActiveRecord::Base
  belongs_to :evaluable, polymorphic: true
end