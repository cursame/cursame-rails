class Gospel::NetworksWorker
  include Sidekiq::Worker

  def perform(name, subdomain)
    uri = build_uri(name, subdomain)
    response = nil
    realtime = Benchmark.realtime { response = HTTParty.get(uri) }
    Rails.logger.gospel.info "{ 'request' : '#{uri}', 'response' : '#{response.nil? ? response : response.body}', 'time' : '#{(realtime*1000).round} ms' }"
  end

  private

  def build_uri(name, subdomain)
    URI::HTTP.build({ 
      host: Settings.gospel.host,
      port: Settings.gospel.port,
      path: Settings.gospel.path.create_network,
      query: URI.escape("name=#{name}&subdomain=#{subdomain}&token_secure=#{Settings.gospel.token}")
    })
  end
end
