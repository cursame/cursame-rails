class Gospel::UsersWorker
  include Sidekiq::Worker
  def perform(email, role, subdomain)
    response = HTTParty.get(URI::HTTP.build({ 
      host: Settings.gospel.host,
      port: Settings.gospel.port,
      path: Settings.gospel.path.create_user,
      query: "email=#{email}&role=#{role}&network_name=#{subdomain}&type_network=free&token_secure=#{Settings.gospel.token}"
    }))
  end
end
