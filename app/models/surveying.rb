class Surveying < ActiveRecord::Base
  belongs_to :course
  belongs_to :survey, :dependent => :destroy
end
