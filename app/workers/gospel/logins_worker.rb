class Gospel::LoginsWorker
  include Sidekiq::Worker
  def perform(email)
    response = HTTParty.get(URI::HTTP.build({ 
      host: Settings.gospel.host,
      port: Settings.gospel.port,
      path: Settings.gospel.path.register_session,
      query: "email=#{email}&token_secure=#{Settings.gospel.token}"
    }))
  end
end
