class QuestionFileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :preview do
    process :resize_to_fit => ['',200]
  end

  version :view do
    process :resize_to_fit => ['',600]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


end
