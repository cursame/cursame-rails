class ScheduledJob::NotificationsWorker
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
    @delivery.publish!
    Notification.create(users: @delivery.accepted_users, notificator: @delivery, kind: kind)
  end

  def notification_survey(id, kind)
    @survey = Survey.find_by_id(id)
    @survey.state = 'published'
    @survey.save!
    Notification.create(users: @survey.accepted_users, notificator: @survey, kind: kind)
  end

  def notification_discussion(id, kind)
    @discussion = Discussion.find_by_id(id)
    Notification.create(users: @discussion.accepted_users, notificator: @discussion, kind: kind)
  end
end