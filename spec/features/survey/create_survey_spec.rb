require 'rails_helper'

RSpec.feature 'Create surveys' do
  background do
    @network = create(:network)
    @user = create(:user, :completed_onboarding, role: 'teacher')
    create_course
    given_logged_in_as(@user)
    fill_in("password", with: 'password')
    visit course_path(@course.id)
    find(:css, '.i-survey-post').click
    fill_survey_form
  end

  scenario 'creates survey with nil end_date', js: true do
    click_on I18n.t('surveys.form.create_test')
    page.has_text?(I18n.t('surveys.correct_create'))
  end

  scenario 'creates survey with false final_grade', js: true do
    fill_in('survey[end_date]', with: Date.today + 3)
    find(:css, '#survey_final_grade').set(false)
    click_on I18n.t('surveys.form.create_test')
    page.has_text?(I18n.t('surveys.correct_create'))
  end

  def create_course
    @course = create(:course, network_id: @network.id)
    create(:members_in_course, user_id: @user.id, course_id: @course.id, accepted: true, owner: true, network_id: @network.id)
  end

  def fill_survey_form
    fill_in('survey[name]', with: 'title')
    fill_in('survey[publish_date]', with: Date.today + 2)
    fill_in('survey[questions_attributes][0][content]', with: 'question1')
    fill_in('survey[questions_attributes][0][answers_attributes][0][content]', with: 'answer1')
  end
end
