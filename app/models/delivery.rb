class Delivery < ActiveRecord::Base
  has_many :deliveries_courses
  has_many :courses, :through => :deliveries_courses
end
