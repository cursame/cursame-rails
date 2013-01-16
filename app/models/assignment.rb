class Assignment < ActiveRecord::Base
  belongs_to :delivery, :dependent => :destroy
  belongs_to :user, :dependent => :destroy
  has_many :compart_assets
  
  accepts_nested_attributes_for :compart_assets
  
  
end
