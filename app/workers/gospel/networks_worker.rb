class Gospel::NetworksWorker
  include Sidekiq::Worker
  def perform(name, subdomain)
    response = HTTParty.get(URI::HTTP.build({ 
      host: Settings.gospel.host,
      port: Settings.gospel.port,
      path: Settings.gospel.path.create_network,
      query: "name=#{name}&subdomain=#{subdomain}&token_secure=#{Settings.gospel.token}"
    }))
  end
end
