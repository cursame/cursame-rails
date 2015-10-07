if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAJONIDQSVOL2ZCIVA',
      aws_secret_access_key: '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'
    }
    config.fog_directory = 'cursame'
    config.fog_public    = true
  end
end
