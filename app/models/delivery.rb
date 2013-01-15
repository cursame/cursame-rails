class Delivery < ActiveRecord::Base
  has_many :deliveries_courses
  has_many :courses, :through => :deliveries_courses
  has_many :areas_of_evaluation
  has_many :assignments
  has_many :areas_of_evaluations

  accepts_nested_attributes_for :areas_of_evaluation
end
