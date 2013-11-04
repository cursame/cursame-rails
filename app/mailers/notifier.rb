# -*- coding: utf-8 -*-
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
    mail to:  @user.email, subject: "Nueva tarea disponible"
  end

  def new_survey_notification(member_in_course,survey)

    @user = member_in_course.user
    @survey = survey

    mail to: @user.email, subject: "Nuevo cuestionario disponible"
  end

  def accepted_message(member_in_course,course)
    @user = member_in_course.user
    @course = course
    mail to: @user.email, subject: "Haz sido aceptado en el curso #{@course.title}"
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
    @user = user
    @content = message
    mail to: @user.email, subject: subject
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
    subject = "#{@user.name} comentó en el curso #{@course.title}"
    mail to: emails, subject: subject
  end

  def new_member_in_course(course, user)
    @course = course
    @user = user
    emails = @course.owners.map{|user| user.email}
    subject = "#{@user.name} desea ingresar al curso #{@course.title} del cual eres maestro"
    mail to: emails, subject: subject
  end

end
