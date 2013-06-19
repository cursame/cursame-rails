class WrapNotification
  attr_accessor :notificator_type, :notificator_id

  def initialize(notificator_type,notificator_id)
    @notificator_type = notificator_type
    @notificator_id = notificator_id
  end

  def destroy_notifications
    notifications = Notification.where(:notificator_type => @notificator_type, :notificator_id => @notificator_id)

    notifications.each do |notification|
      notification.destroy
    end
  end

  handle_asynchronously :destroy_notifications, :priority => 20, :run_at => Proc.new{Time.zone.now}

end
