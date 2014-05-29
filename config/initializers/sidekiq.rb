Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://23.23.191.60:6379' }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://23.23.191.60:6379' }
end