class MailPreview < MailView

  def welcome
    MeemsMailer.welcome('user@domain.tld')
  end
end
