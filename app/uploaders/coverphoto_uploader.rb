# encoding: utf-8

class CoverphotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

   version :expanded do
      process :resize_to_fit => [937, 270]
    end

   version :mosaic do
      process :resize_to_fill => [62, 62]
  end


    def extension_white_list
       %w(jpg jpeg gif png)
    end  


   def store_dir
     "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
   end
end
