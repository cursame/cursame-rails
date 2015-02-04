class Gospel::UsersWorker
  include Sidekiq::Worker
  
  def perform(email, role, subdomain)
    uri = build_uri(email, role, subdomain)
    response = nil
    realtime = Benchmark.realtime { response = HTTParty.get(uri) }
    Rails.logger.gospel.info "{ 'request' : '#{uri}', 'response' : '#{response.nil? ? response : response.body}', 'time' : '#{(realtime*1000).round} ms' }"
  end

  private

  def build_uri(email, role, network_name, subdomain)
    URI::HTTP.build({ 
      host: Settings.gospel.host,
      port: Settings.gospel.port,
      path: Settings.gospel.path.create_user,
      query: URI.escape("email=#{email}&role=#{role}&network_name=#{network_name}&subdomain=#{subdomain}&type_network=pro&token_secure=#{Settings.gospel.token}")
    })
  end
end
