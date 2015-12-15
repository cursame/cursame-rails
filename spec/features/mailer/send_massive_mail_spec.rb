require 'rails_helper'

RSpec.feature 'Admin send massive mail' do
  before(:each) do
    @network = create(:network)
    @admin = create(:user, role: 'admin')
    @teacher = create(:user, role: 'teacher')
    @teacher2 = create(:user, role: 'teacher')
    @student = create(:user, role: 'student')
    @student2 = create(:user, role: 'student')
    @course = create_course(@teacher, @network)
    assign_member_in_course(@course, @student, @network)
    given_logged_in_as(@admin)
  end

  scenario 'Send email only to users confirmed' do
    @unconfirmed_user = create(:user, confirmed_at: nil)
    navigate_to_send_massive_mail_path
    fill_massive_mail_form
    click_on I18n.t('managers.mailer.send')
    expect(Sidekiq::Extensions::DelayedMailer.jobs.size).to eq(4)
  end

  scenario 'Send email only to teachers' do
    navigate_to_send_massive_mail_path
    find(:css, "#users[value='only_teachers']").set(true)
    fill_massive_mail_form
    click_on I18n.t('managers.mailer.send')
    expect(Sidekiq::Extensions::DelayedMailer.jobs.size).to eq(2)
  end

  scenario 'Send email only to students' do
    navigate_to_send_massive_mail_path
    find(:css, "#users[value='only_students']").set(true)
    fill_massive_mail_form
    click_on I18n.t('managers.mailer.send')
    expect(Sidekiq::Extensions::DelayedMailer.jobs.size).to eq(2)
  end


  scenario 'Exist an option to send massive mailer in Admin panel' do
    visit managers_courses_path
    expect(page).to have_content(I18n.t('managers.courses.index.send_massive_mail'))
  end

  scenario 'The button render course massive mailer form' do
    visit managers_courses_path
    click_on I18n.t('managers.courses.index.send_massive_mail')
    expect(page).to have_content(I18n.t('managers.course_mailer.massive_mailer_title'))
    page.has_text?(I18n.t('managers.course_mailer.example'))
    expect(page).to have_content(I18n.t('managers.course_mailer.message'))
    page.has_text?(I18n.t('managers.course_mailer.send'))
  end

  scenario 'Exist a path to visit course masive mailer form' do
    visit managers_course_mailer_path(course: @course.id)
    expect(page).to have_content(I18n.t('managers.course_mailer.massive_mailer_title'))
  end

  scenario 'Exist an option to send mail to all users in course' do
    visit managers_course_mailer_path(course: @course.id)
    find(:css, "#users[value='all']").set(true)
  end

  scenario 'Exist an option to send mail only to teachers in course' do
    visit managers_course_mailer_path(course: @course.id)
    find(:css, "#users[value='only_teachers']")
  end

  scenario 'Exist an option to send mail only to students in course' do
    visit managers_course_mailer_path(course: @course.id)
    find(:css, "#users[value='only_students']")
  end

  scenario 'Send mail to all course members' do
    visit managers_course_mailer_path(course: @course.id)
    find(:css, "#users[value='all']").set(true)
    fill_massive_mail_form
    click_on I18n.t('managers.course_mailer.send')
    expect(Sidekiq::Extensions::DelayedMailer.jobs.size).to eq(2)
  end

  scenario 'Send mail only to course teachers' do
    visit managers_course_mailer_path(course: @course.id)
    find(:css, "#users[value='only_teachers']").set(true)
    fill_massive_mail_form
    click_on I18n.t('managers.course_mailer.send')
    expect(Sidekiq::Extensions::DelayedMailer.jobs.size).to eq(1)
  end

  scenario 'Send mail only to course students' do
    visit managers_course_mailer_path(course: @course.id)
    find(:css, "#users[value='only_students']").set(true)
    fill_massive_mail_form
    click_on I18n.t('managers.course_mailer.send')
    expect(Sidekiq::Extensions::DelayedMailer.jobs.size).to eq(1)
  end

  scenario 'Send a list of course users' do
    visit managers_course_mailer_path(course: @course.id)
    click_on I18n.t('managers.course_mailer.users_list')
    fill_massive_mail_form
    find(:css, "#users_[value='#{@student.id}']").set(true)
    click_on I18n.t('managers.course_mailer.send')
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
