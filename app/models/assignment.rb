class Assignment < ActiveRecord::Base
  belongs_to :delivery, :dependent => :destroy
  belongs_to :user, :dependent => :destroy
  belongs_to :course 
  has_many :assignment_assets
  has_many :assets, :through => :assignment_assets, :as => :super_asset
  
  
  accepts_nested_attributes_for :assets
  

  
  
end
