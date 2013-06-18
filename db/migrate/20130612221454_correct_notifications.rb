class CorrectNotifications < ActiveRecord::Migration
  def up

    registers = Notification.all.map{ |x| [x.notificator_type,x.notificator_id,x.kind]}
    registers.uniq!

    registers.each do |register|
      notifications = Notification.where(:notificator_type => register[0], :notificator_id => register[1],:kind => register[2])
      users = []
      notifications.each do |notification|
        users += [User.find(notification.user_id)]
      end

      register.push(users)
    end

    Notification.destroy_all

    registers.each do |register|
      Notification.create(:users => register[3], :notificator_type => register[0], :notificator_id => register[1], :kind => register[2])
    end
  end

  def down
  end
end
