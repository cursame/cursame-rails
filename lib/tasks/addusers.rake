# encoding: UTF-8
namespace :addusers do

  task :csv => :environment do

    new_users = []

    begin
      line = 0
      CSV.foreach(ARGV[1]) do |row|
        new_user = {
          :email      => row[0],
          :role       => row[1],
          :first_name => row[2].split.map(&:capitalize).join(' '),
          :last_name  => row[3].split.map(&:capitalize).join(' '),
          :subdomain  => row[4].downcase
        }
        puts "\e[1;32minfo:\e[0m parsing row #{new_user}"
        line += 1
        new_users << new_user
      end
    rescue
      puts "\e[1;31merror:\e[0m error reading csv file at line #{line+=1}"
    end

    new_users.each do |user|

      network = Network.find_by_subdomain user[:subdomain]
      if network.nil?
        puts "\e[1;31merror:\e[0m could not find network #{user[:subdomain]}"
        next
      end

      user_info = {
        :email        => user[:email],
        :password     => Devise.friendly_token,
        :first_name   => user[:first_name],
        :last_name    => user[:last_name],
        :personal_url => SecureRandom.uuid,
        :domain       => 'cursa.me',
        :subdomain    => user[:subdomain]
      }

      new_user = User.find_by_email(user[:email])
      if new_user.nil?
        puts "\e[1;32minfo:\e[0m creating user #{user_info}"
        new_user = User.create user_info

        permission_info = {
          :user_id => new_user.id,
          :role_id => user[:role],
          :network_id => network.id
        }
        puts "\e[1;32minfo:\e[0m creating permissioning #{permission_info}"
        Permissioning.create(permission_info)
      else
        puts "\e[1;32minfo:\e[0m user exists: #{user_info}"
      end
    end
  end
end