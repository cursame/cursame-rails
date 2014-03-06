class Notifier < ActionMailer::Base
  default from: "cursa.me@cursa.me",
          domain: "cursa.me",
          user_name: "cursa.me"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_delivery_notification.subject
  #
  def new_delivery_notification(users,delivery)
    users.each do |user|
      @user = user
      @delivery = delivery
      mail to:  @user.email, subject: "Nueva tarea disponible"
    end
  end

  def new_survey_notification(users,survey)
    users.each do |user|
      @user = user
      @survey = survey
      mail to: @user.email, subject: "Nuevo cuestionario disponible"
    end
  end 

  def new_discussion_notification(users,discussion)
    users.each do |user|
      @user = user
      @discussion = discussion
      mail to: @user.email, subject: "Nueva discusion disponible"
    end
  end

  def accepted_message(member_in_course,course)
    @user = member_in_course.user
    @course = course
    mail to: @user.email, subject: "Has sido aceptado en el grupo #{@course.title}"
  end

  def new_member_in_course(member_in_course,course)
    owners = course.members_in_courses.keep_if{ |member| member.owner == true }
    emails = owners.map{ |owner| owner.user.email }
    @member = member_in_course.user
    @course = course
    mail to: emails, subject: "Un nuevo usuario esta esperando para ser aceptado en el curso #{@course.title}"
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
    user_mail = user.email
    @subdomain = user.subdomain
    @domain = user.domain
    @content = message
    mail to: user_mail, subject: subject
  end

  def send_limit_deliveries(user)
    @user = user
    count = user.settings_teacher.limit_deliveries
    mail to: @user.email, subject: "You have "+ count.to_s + " Assignments"
  end

  def send_import_users(user,arrayErrores)
    @user = user
    @errores = arrayErrores
    mail to: user.email, subject: "Informe: Importacion de Usuarios"
  end

  def send_import_courses(user,arrayErrores)
    @user = user
    @errores = arrayErrores
    mail to: @user.email, subject: "Informe: Importacion Cursos"
  end

  def send_import_members(user,arrayErrores,course)
    @user = user
    @errores = arrayErrores
    @course = course

    mail to: @user.email, subject: "Informe: Importacion de Miembros al curso " + course.title

  end

  def send_comment_on_course(comment)
    @comment = comment
    @isComment_on_comment = comment.commentable_type == 'Comment'
    @user = comment.user
    if (@isComment_on_comment)
      users = comment.commentable.commentable.users
      @course = comment.commentable.commentable
    else
      users = comment.commentable.users
      @course = comment.commentable
    end

    emails = users.map{|user| user.email}
    emails = emails.keep_if{ |email|  email != @user.email}
    subject = "#{@user.name} comento en el curso #{@course.title}"
    mail to: emails, subject: subject
  end

  def new_member_in_course(course, user)
    @course = course
    @user = user
    emails = @course.owners.map{|user| user.email}
    subject = "#{@user.name} desea ingresar al curso #{@course.title} del cual eres maestro"
    mail to: emails, subject: subject
  end

  def user_mailer_with_password(user, password)
    @user = user
    @password = password
    subject = "#{@user.name} has sido confirmado en la red"
    mail to:@user.email, subject: subject
  end
  

  def masive_mailer_for_super_admin(user, message)
    @user = user
    @message = message
    subject = " #{@user.name}"
    mail to:@user.email, subject: "#{@message.title}"
  end

end
