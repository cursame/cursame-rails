class FileUploader < CarrierWave::Uploader::Base

  def store_dir
    "uploads/asset/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif ico png pdf exe ppt txt pptx dmg dwg dwf xls xlsx xlsm xlsb rar zip tar iso swf flv doc docx docm dotx dotm ade cad adp odt rtf sxw sao csv xls avi mp4 mov wma mpge flv m4v)
  end

  def move_to_cache
    true
  end

  def move_to_store
    true
  end

end
