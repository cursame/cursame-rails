require 'rails_helper'

RSpec.feature 'Select courses student onboarding' do
  background do
    @network = create(:network)
    @teacher = create(:user, role: 'teacher')
    @student = create(:user, role: 'student')
    @course = create_course(@teacher, @network)
    given_logged_in_as(@student)
    visit onboarding_select_courses_path
  end

  scenario 'Student select one course' do
    expect(page).to have_content(I18n.t('onboarding.select_courses.select_courses_step'))
    expect{
      click_on (I18n.t('courses.shared.course_card_actions.registering'))
    }.to change { MembersInCourse.count }
  end

  scenario 'Student search a course' do
    fill_in 'query', with: @course.title
    click_on (I18n.t('onboarding.select_courses.search'))
    expect(page).to have_content(I18n.t('onboarding.search_courses.search'))
    expect(page).to have_content(@course.title)
  end
end
