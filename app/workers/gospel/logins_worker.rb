class Gospel::LoginsWorker
  include Sidekiq::Worker

  def perform(email)
    uri = build_uri(email)
    response = nil
    realtime = Benchmark.realtime { response = HTTParty.get(uri) }
    Rails.logger.gospel.info "{ 'request' : '#{uri}', 'response' : '#{response.nil? ? response : response.body}', 'time' : '#{realtime}' }"
  end

  private

  def build_uri(email)
    URI::HTTP.build({ 
      host: Settings.gospel.host,
      port: Settings.gospel.port,
      path: Settings.gospel.path.register_session,
      query: URI.escape("email=#{email}&token_secure=#{Settings.gospel.token}")
    })
  end
end
