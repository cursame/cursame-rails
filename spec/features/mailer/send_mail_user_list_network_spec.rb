require 'rails_helper'

RSpec.feature 'Admin send mail to list' do
  before(:each) do
    @network = create(:network)
    @admin = create(:user, role: 'admin')
    @teacher = create(:user, role: 'teacher')
    @teacher2 = create(:user, role: 'teacher')
    @student = create(:user, role: 'student')
    @student2 = create(:user, role: 'student')
  end

  scenario 'Send email only to user list', js: true do
    given_logged_in_as(@admin)
    fill_in("password", with: 'password')
    navigate_to_send_massive_mail_path
    click_on I18n.t('managers.mailer.select_users')
    fill_massive_mail_form
    fill_in("users-search-input", with: @teacher.first_name)
    find("#ui-id-2").click
    click_on I18n.t('managers.network_mailer_user_list.send')
    expect(Sidekiq::Extensions::DelayedMailer.jobs.size).to eq(1)
  end

  scenario 'Send email only to teacher list', js: true do
    given_logged_in_as(@admin)
    fill_in("password", with: 'password')
    navigate_to_send_massive_mail_path
    click_on I18n.t('managers.mailer.select_teachers')
    fill_massive_mail_form
    fill_in("teachers-search-input", with: @teacher.first_name)
    find("#ui-id-2").click
    click_on I18n.t('managers.network_mailer_teacher_list.send')
    expect(Sidekiq::Extensions::DelayedMailer.jobs.size).to eq(1)
  end

  scenario 'Send email only to student list', js: true do
    given_logged_in_as(@admin)
    fill_in("password", with: 'password')
    navigate_to_send_massive_mail_path
    click_on I18n.t('managers.mailer.select_students')
    fill_massive_mail_form
    fill_in("students-search-input", with: @student.first_name)
    find("#ui-id-2").click
    click_on I18n.t('managers.network_mailer_student_list.send')
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
