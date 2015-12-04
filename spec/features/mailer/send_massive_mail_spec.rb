require 'rails_helper'

RSpec.feature 'Admin send massive mail' do
  background do
    @network = create(:network)
    @admin = create(:user, role: 'admin')
  end

  scenario 'Send email only to users confirmed' do
    @user = create(:user, role: 'teacher')
    @unconfirmed_user = create(:user, confirmed_at: nil)
    given_logged_in_as(@admin)
    navigate_to_send_massive_mail_path
    fill_massive_mail_form
    click_on I18n.t('managers.mailer.send')
    expect(Sidekiq::Extensions::DelayedMailer.jobs.size).to eq(1)
  end

  def navigate_to_send_massive_mail_path
    visit managers_path
    visit managers_mailer_path
  end

  def fill_massive_mail_form
     fill_in('subject', with: 'Subject')
     fill_in('message', with: 'message')
  end
end