class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_delivery_notification.subject
  #
  def new_delivery_notification(member_in_course,delivery)
    @user = User.find(member_in_course.user_id)
    @delivery = delivery
    @greeting = "Hi"

    mail to: @user.mail, :subject => "New Delivery Avaliable"
  end
end
