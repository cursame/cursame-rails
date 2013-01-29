class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  
  has_many :surveyings
  has_many :courses, :through => :surveyings
  has_many :compart_assets
  has_many :assets, :through => :compart_assets
  

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end