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
    when 'wufoo_form'
    when 'Course'
    # when 'Assignment'
    # when 'user_survey'
    # when 'reported_content'
    # when 'members_in_course'
    else
    end
        
  end

  private

  def users(model)
    users = []
    model.courses.each do |course|
      course.members_in_courses.each do |member|
        user = member.user
        users.push(user) if user.id != model.user_id && member.accepted == true
      end
    end
  end

  def notification_delivery(id, kind)
    delivery = Delivery.find_by_id(id)
    Notification.create(:users => users(delivery), :notificator => delivery, :kind => kind)
  end

  def notification_survey(id, kind)
    survey = Survey.find_by_id(id)
    Notification.create(:users => users(survey), :notificator => survey, :kind => kind)
  end

  def notification_discussion
    discussion = Survey.find_by_id(id)
    Notification.create(:users => users(discussion), :notificator => discussion, :kind => kind)
  end
end