# encoding: UTF-8
class Notifier < ActionMailer::Base
  default from: 'hola@cursa.me'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_delivery_notification.subject
  #
  def new_delivery_notification(users,delivery)
    users.each do |user|
      @user = user
      @delivery = delivery
      set_logo(@user)

      mail to:  @user.email, subject: "Nueva tarea disponible"
    end
  end

  def new_survey_notification(users,survey)
    users.each do |user|
      @user = user
      @survey = survey
      set_logo(@user)

      mail to: @user.email, subject: "Nuevo cuestionario disponible"
    end
  end

  def new_discussion_notification(users,discussion)
    users.each do |user|
      @user = user
      @discussion = discussion
      set_logo(@user)

      mail to: @user.email, subject: "Nueva discusion disponible"
    end
  end

  def accepted_message(member_in_course,course)
    @user = member_in_course.user
    @course = course
    set_logo(@user)

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
    set_logo(@user)

    mail to: @user.email, subject: subject
  end

  def send_email(sender_id, recipient_id, subject, message)
    admin = User.find_by_id(sender_id)
    @user = User.find_by_id(recipient_id)
    @subdomain = @user.subdomain
    @domain = @user.domain
    @content = message
    set_logo(@user)
    user_name = admin.first_name + ' ' + admin.last_name

    mail from: "#{user_name} <#{admin.email}>", to: @user.email, subject: subject
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

    set_logo(@user)

    emails = users.map{|user| user.email}
    emails = emails.keep_if{ |email|  email != @user.email}
    subject = "#{@user.name} comento en el curso #{@course.title}"
    mail to: emails, subject: subject
  end

  def new_member_in_course(course, user)
    @course = course
    @user = user
    set_logo(@user)

    emails = @course.owners.map{|user| user.email}
    subject = "#{@user.name} desea ingresar al curso #{@course.title} del cual eres maestro"
    mail to: emails, subject: subject
  end

  def user_mailer_with_password(user, password)
    @user = user
    @password = password
    set_logo(@user)

    subject = "#{@user.name} has sido confirmado en la red"
    mail to:@user.email, subject: subject
  end


  def masive_mailer_for_super_admin(user, message)
    @user = user
    @message = message
    set_logo(@user)

    subject = " #{@user.name}"
    mail to:@user.email, subject: "#{@message.title}"
  end

  def send_contact_mail(params, to, subject, request_demo)
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @phone_ext = params[:phone_ext]
    @position = params[:position]
    @school = params[:school]
    @lms = params[:lms_usage]
    @other_lms = params[:lms_other]
    @message = params[:message]
    @mkt_langin_id = params[:mkt_langin_id]
    @request_demo = request_demo
    mail to:to, subject: subject
  end

  def csv_import_email(email, new_users)
    @new_users = new_users
    @user = User.find_by_email(email)
    mail(to: email, subject: 'Alta de usuarios')
  end


  private
  def set_logo(user)
    if @user.networks.last && @user.networks.last.logo?
      @logo_url = @user.networks.last.logo
    end
  end
end
