class Asset < ActiveRecord::Base
  
  belongs_to :user, :dependent => :destroy
  #has_many :compart_assets
  #has_many :questions, :through => :compart_assetss, :source => :questions
  #has_many :comment, :through => :compart_assetss, :source => :comment
  #has_many :deliveries, :through => :compart_assets, :source => :delivery
  #has_many :assignment, :through => :compart_assetss, :source => :assignment
  
  #attr_accessible :create, :file, :password, :title, :description, :encryption_code_to_access, :user_id, :compart_assetss,:questions,:comment, :delivery,:assignment
  
  has_many :delivery_assets
  has_many :deliveries, :through => :delivery_assets
  
  #uploader to upadate files
   mount_uploader :file, FileUploader
  
   
    
end
