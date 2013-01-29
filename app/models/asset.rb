class Asset < ActiveRecord::Base
  
  belongs_to :user, :dependent => :destroy
  has_many :compart_assetss
  has_many :questions, :through => :compart_assetss
  has_many :comment, :through => :compart_assetss
  has_many :delivery, :through => :compart_assetss
  has_many :assignment, :through => :compart_assetss
  
  
  
  #uploader to upadate files
   mount_uploader :file, FileUploader
   

   
    
end
