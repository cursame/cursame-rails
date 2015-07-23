#encoding: utf-8
class UsersMailer < ActionMailer::Base

  default from: '"Cúrsame" <hola@cursa.me>'

  def notice_to_user(user)
  end

  def teachers_day(user)
    @user = user

    mail(to: @user.email, subject: 'Feliz Día del Maestro')
  end

end
