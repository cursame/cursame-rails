class Assignment < ActiveRecord::Base
  belongs_to :delivery
  belongs_to :user
  belongs_to :course 
  has_many :assignment_assets
  has_many :assets, :through => :assignment_assets
  has_many :response_to_the_evaluations, :dependent => :destroy
  
  
  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :response_to_the_evaluations
  

  
  
end
