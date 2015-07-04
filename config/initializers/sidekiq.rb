redis_domain = ENV['REDIS_PORT_6379_TCP_ADDR'] || "localhost"
redis_port   = ENV['REDIS_PORT_6379_TCP_PORT'] || "6379"

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{redis_domain}:#{redis_port}/0" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{redis_domain}:#{redis_port}/0" }
end
