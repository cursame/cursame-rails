require 'charlock_holmes'

class UserCsvWorker
  include Sidekiq::Worker

  def perform(file, subdomain)
    contents = File.read(file)
    detection = CharlockHolmes::EncodingDetector.detect(contents)
    
    new_users = []
    CSV.foreach(file, encoding: detection[:encoding], headers: true) do |row|
      new_users << { user: { email: row[0], first_name: row[2], last_name: row[3], subdomain: subdomain, domain: 'cursa.me', personal_url: SecureRandom.uuid, password: Devise.friendly_token }, role: row[1] }
    end

    network = Network.find_by_subdomain(subdomain)
    new_users.each do |user_params|
      user = User.new(user_params[:user])
      user.permissionings.push(Permissioning.new user: user, network: network)
      case user_params[:role]
      when /administrador/
        user.permissionings.first.role = Role.find_by_title 'admin'
      when /maestro/
        user.permissionings.first.role = Role.find_by_title 'teacher'
      when /alumno/
        user.permissionings.first.role = Role.find_by_title 'student'
      end
      user.save!
    end
  end
end