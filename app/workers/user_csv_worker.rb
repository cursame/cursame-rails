require 'charlock_holmes'

class UserCsvWorker
  include Sidekiq::Worker

  def perform(file, subdomain, email)
    detection = CharlockHolmes::EncodingDetector.detect(File.read(file))
    return if detection[:type] != :text

    new_users_params = []
    CSV.foreach(file, encoding: detection[:encoding], headers: true) do |row|
      new_users_params << { user: { email: row[0], first_name: row[2], last_name: row[3], subdomain: subdomain, domain: 'cursa.me', personal_url: SecureRandom.uuid, password: Devise.friendly_token }, role: row[1] }
    end

    new_users = []
    network = Network.find_by_subdomain(subdomain)
    new_users_params.each do |user_params|
      user = User.new(user_params[:user])
      user.permissionings.push(Permissioning.new user: user, network: network)
      case user_params[:role]
      when /administrador/
        user.permissionings.first.role = Role.find_by_title 'admin'
      when /maestro/
        user.permissionings.first.role = Role.find_by_title 'teacher'
      when /alumno/
        user.permissionings.first.role = Role.find_by_title 'student'
      when /operador/
        user.permissionings.first.role = Role.find_by_title 'operator'
      end
      user.save
      new_users << user
    end
    Notifier.csv_import_email(email, new_users).deliver
  end
end
