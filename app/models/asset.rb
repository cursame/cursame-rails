class Asset < ActiveRecord::Base
  
  belongs_to :user, :dependent => :destroy
  has_many :compart_assetss
  
  
  #uploader to upadate files
   mount_uploader :file, FileUploader
    
end
