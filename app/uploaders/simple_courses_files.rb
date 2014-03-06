# encoding: utf-8

class SimpleCoursesFiles< CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  #def extension_white_list
  #%(pdf xls xlsx ppt txt pptx doc docx odt adp ade png jpg jpeg gif tif bmp avi mp4 mov wma mpge flv m4v exe zip rar iso dmg psd cad)
  #end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  

  

end
