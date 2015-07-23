class MailPreview < MailView

  def welcome
    MeemsMailer.welcome('user@domain.tld')
  end

  def new_delivery_notification_meems
    user = User.find_by_email("emiliano+meems+mentor@cursa.me")
    Notifier.new_delivery_notification([user], Delivery.last)
  end

  def new_delivery_notification_cursame
    user = User.find_by_email("emiliano+admin+version4@cursa.me")
    Notifier.new_delivery_notification([user], Delivery.last)
  end
end
