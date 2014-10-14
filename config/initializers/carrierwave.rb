CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAJONIDQSVOL2ZCIVA',
      :aws_secret_access_key => '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'
    }
    config.fog_directory = 'cursame'
    config.fog_public    = true
  end
end
