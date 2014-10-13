class CoverphotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  version :expanded do
    process :resize_to_fill => [937, 270]
  end

  version :mosaic do
    process :resize_to_fill => [352, 272]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}.png"
  end

end
