# encoding: utf-8
class MeemsMailer < ActionMailer::Base
  default from: '"Cúrsame" <hola@cursa.me>'
  layout 'meems_mailer'

  def welcome(email)
    mail to: email, subject: 'Modelo de Emprendedores para la Educación Media Superior'
  end
end
