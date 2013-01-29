class Assignment < ActiveRecord::Base
  belongs_to :delivery, :dependent => :destroy
  belongs_to :user, :dependent => :destroy
  has_many :compart_assets
  has_many :assets, :through => :compart_assets, :source => :assignment
  
  
  accepts_nested_attributes_for :assets
  
  
end
