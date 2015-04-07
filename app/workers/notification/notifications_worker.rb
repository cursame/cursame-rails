class Notification::NotificationsWorker
  include Sidekiq::Worker

  def perform(notificator_id, notificator_type, kind)
    # users = users(notificator_id, notificator_type, kind)
    # notificator = notificator(notificator_id, notificator_type, kind)
    # Notification.create(:users => users, :notificator => notificator, :kind => 'new_delivery_on_course')
    puts notificator_type + kind
  end

  private


end