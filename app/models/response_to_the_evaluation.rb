class ResponseToTheEvaluation < ActiveRecord::Base
  belongs_to :feedbackable, polymorphic: true
  belongs_to :evaluation_criterium
  
end
