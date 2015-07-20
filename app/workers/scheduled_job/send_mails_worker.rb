class ScheduledJob::SendMailsWorker
  include Sidekiq::Worker

  def perform(notificator_id, notificator_type)
    case notificator_type
    when 'Delivery'
      send_mails_delivery(notificator_id)
    when 'Survey'
      send_mails_survey(notificator_id)
    when 'Discussion'
      send_mails_discussion(notificator_id)
    end
  end

  private

  def send_mails_delivery(id)
    @delivery = Delivery.find_by_id(id)
    @delivery.send_mail(@delivery.accepted_users) unless @delivery.nil?
  end

  def send_mails_survey(id)
    @survey = Survey.find_by_id(id)
    @survey.send_mail(@survey.accepted_users) unless @survey.nil?
  end

  def send_mails_discussion(id)
    @discussion = Discussion.find_by_id(id)
    @discussion.send_mail(@discussion.accepted_users) unless @discussion.nil?
  end
end
