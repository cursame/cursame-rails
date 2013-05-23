class Notifier < ActionMailer::Base
  default from: "mail-sin-respuesta@cursa.me"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_delivery_notification.subject
  #
  def new_delivery_notification(member_in_course,delivery)
    @user = member_in_course.user
    @delivery = delivery
    mail to:  @user.email, subject: "New Delivery Avaliable"
  end

  def new_survey_notification(member_in_course,survey)

    @user = member_in_course.user
    @survey = survey

    mail to: @user.email, subject: "New Survey Avaliable"
  end

  def accepted_message(member_in_course,course)
    @user = member_in_course.user
    @course = course
    mail to: @user.email, subject: "You have been accepted"
  end

  def new_member_in_course(member_in_course,course)
    owners = course.members_in_courses.keep_if{ |member| member.owner == true }
    emails = owners.map{ |owner| owner.user.email }
    @member = member_in_course.user
    @course = course
    mail to: emails, subject: "A new user waits for be accepted"
  end

  def send_email_members_in_course(member_in_course, subject, message)
    @user = member_in_course.user
    @content = message
    mail to: @user.email, subject: subject
  end

  def send_limit_surveys(user)
    @user = user
    count = user.settings_teacher.limit_surveys
    mail to: @user.email, subject: "You have " + count.to_s + " User_Surveys"
  end

  def send_email(user,subject,message)
    @user = user
    @content = message
    mail to: @user.email, subject: subject
  end

  def send_limit_deliveries(user)
    @user = user
    count = user.settings_teacher.limit_deliveries
    mail to: @user.email, subject: "You have "+ count.to_s + " Assignments"
  end

  def send_import(user,arrayErrores)
    @user = user
    @errores = arrayErrores
    mail to: @user.email, subject: "Tu passwod en cursame"
  end

end
