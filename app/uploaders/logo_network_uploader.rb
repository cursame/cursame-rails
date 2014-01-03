class LogoNetworkUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  
  storage :file
  
   version :response do
      process :resize_to_fill => [128, 26]
    end
    
   version :square do
     process :resize_to_fill => [26, 26]
   end

   
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
