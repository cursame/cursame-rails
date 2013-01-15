class Asset < ActiveRecord::Base
  
  belongs_to :user
  
  #uploader to upadate files
   mount_uploader :file, FileUploader
    
end
