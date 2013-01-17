class AreasOfEvaluation < ActiveRecord::Base
  belongs_to :delivery, :dependent => :destroy
  
end
