# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base 
  storage :file

  def store_dir
    "uploads/asset/#{model.id}"
  end

  def extension_white_list
     %w(jpg jpeg gif ico png pdf exe ppt txt pptx dmg dwg dwf rar zip tar iso swf flv doc docx ade adp odt rtf sxw sao csv xls)
  end
  

 
end
