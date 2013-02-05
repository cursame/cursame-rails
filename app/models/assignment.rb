class Assignment < ActiveRecord::Base
  belongs_to :delivery, :dependent => :destroy
  belongs_to :user, :dependent => :destroy
  belongs_to :course 
  has_many :assignment_assets
  has_many :assets, :through => :assignment_assets
  has_many :response_to_the_evaluations
  
  
  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :response_to_the_evaluations
  

  
  
end
