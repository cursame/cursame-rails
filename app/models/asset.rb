class Asset < ActiveRecord::Base
  
  belongs_to :user

  has_many :delivery_assets
  has_many :deliveries, :through => :delivery_assets
  has_many :question_assets
  has_many :questions, :through => :question_assets
  has_many :assignment_assets
  has_many :assignments, :through => :assignment_assets
  
  
  #uploader to upadate files
   mount_uploader :file, FileUploader
  
   
    
end
