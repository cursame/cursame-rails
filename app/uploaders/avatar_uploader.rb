# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  version :profile do
     process :resize_to_fit => [90, 90]
   end

   version :modern do
     process :resize_to_fill => [40, 40]
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
      %w(jpg jpeg gif png)
   end  
   
   def default_url 
      "/assets/#{model.name}_#{version_name}.png"
   end
   
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
