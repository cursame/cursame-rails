
class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  version :profile do
     process :resize_to_fit => [150, 150]
   end
   
   version :course_index do 
        process :resize_to_fit => [240, 135]
    end

   version :modern do
     process :resize_to_fill => [45, 45]
   end
   
   version :head do
     process :resize_to_fit => [30, 30]
   end
   
  version :mini do
      process :resize_to_fill => [25, 25]
  end
      
   version :compress do
     process :resize_to_fit => [10, 10]
   end   
 

   def extension_white_list
      %w(jpg jpeg gif ico png)
   end  
   
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
