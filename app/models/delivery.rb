class Delivery < ActiveRecord::Base
  has_many :deliveries_courses
  has_many :courses, :through => :deliveries_courses, :dependent => :destroy
  has_many :areas_of_evaluation
  has_many :assignments
  has_many :areas_of_evaluations
  has_many :compart_assets
  has_many :assets, :through => :compart_assets, :source => :delivery
  
  
  accepts_nested_attributes_for :areas_of_evaluations
  accepts_nested_attributes_for :assets
  
  
end
