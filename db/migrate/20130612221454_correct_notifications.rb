class CorrectNotifications < ActiveRecord::Migration
  def up

    c = Time.now
    puts "Inicio del script " + "#{Time.now.to_s}" + ": "

    registers = Notification.all.map{ |x| [x.notificator_type,x.notificator_id,x.kind]}
    registers.uniq!

    puts "Numero de registros: = " + "#{registers.size}"

    a = Time.now
    puts "Inicio de obtener los usuarios por registro: " + "#{a.to_s}"

    registers.each do |register|
      notifications = Notification.where(:notificator_type => register[0], :notificator_id => register[1],:kind => register[2])
      users = []
      notifications.each do |notification|
        users += [User.find(notification.user_id)]
      end

      register.push(users)
    end

    b = Time.now

    puts "Termino de poner los registros: " + "#{(b-a).to_s}"

    a = Time.now
    puts "Inicio de la destruccion: " + "#{a.to_s}"
    Notification.destroy_all

    b = Time.now
    puts "Destruccion completa: " + "#{ (b-a).to_s}"

    a = Time.now
    puts "Inicio del crear la notificaciones: " + "#{ a.to_s}"
    registers.each do |register|
      Notification.create(:users => register[3], :notificator_type => register[0], :notificator_id => register[1], :kind => register[2])
    end

    b = Time.now

    puts "Termino de crear las notificaciones: " + "#{ (b-a).to_s}"

    d = Time.now

    puts "Tiempo total del request: " + "#{(c-d).to_s}"
  end

  def down
  end
end
