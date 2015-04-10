class Notification::NotificationsWorker
  include Sidekiq::Worker

  def perform(notificator_id, notificator_type, kind)
    case notificator_type
    when 'Delivery'
      notification_delivery(notificator_id, kind)
    when 'Survey'
      notification_survey(notificator_id, kind)
    when 'Discussion'
      notification_discussion(notificator_id, kind)
    # when 'wufoo_form'
    # when 'Course'
    else
    end
        
  end

  private

  def notification_delivery(id, kind)
    @delivery = Delivery.find_by_id(id)
    Notification.create(users: @delivery.notification_users, notificator: @delivery, kind: kind)
  end

  def notification_survey(id, kind)
    @survey = Survey.find_by_id(id)
    Notification.create(users: @survey.notification_users, notificator: @survey, kind: kind)
  end

  def notification_discussion
    @discussion = Survey.find_by_id(id)
    Notification.create(users: @discussion.notification_users, notificator: @discussion, kind: kind)
  end
end