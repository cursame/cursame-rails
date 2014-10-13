class LogoNetworkUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  version :response do
    process :resize_to_fill => [44, 44]
  end

  version :square do
    process :resize_to_fit => ['',44]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
