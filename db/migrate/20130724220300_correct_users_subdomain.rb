class CorrectUsersSubdomain < ActiveRecord::Migration
  def up
    users = User.all
    users.each do |user|
      if user.subdomain.nil? then
        if user.networks.last.nil? then
          user.update_attributes(:subdomain => Network.last.subdomain)
        else
          user.update_attributes(:subdomain => user.networks.last.subdomain)
        end
      end
    end
  end

  def down
  end
end
