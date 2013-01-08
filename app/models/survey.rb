class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  
  has_many :surveyings
  has_many :courses, :through => :surveyings

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end