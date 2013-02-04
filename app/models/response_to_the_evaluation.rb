class ResponseToTheEvaluation < ActiveRecord::Base
  belongs_to :assignment, :dependent => :destroy
  belongs_to :course
end
