class Delivery < ActiveRecord::Base
  scope :courses
  has_many :deliveries_courses
  has_many :courses, :through => :deliveries_courses, :dependent => :destroy
  has_many :areas_of_evaluation
  has_many :assignments
  has_many :areas_of_evaluations
  belongs_to :user
  has_many :delivery_assets
  has_many :assets, :through => :delivery_assets
  
 # attr_accessible :dk_assets,  :title, :porcent_of_evaluation, :description, :publish_date, :end_date, :assets_attributes, :course_ids,  :file, :encryption_code_to_access, :user_id
  
  accepts_nested_attributes_for :areas_of_evaluations
  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :assignments, :assets
  
  
end
