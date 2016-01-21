require 'rails_helper'

RSpec.feature 'Create course' do
  background do
    @network = create(:network)
    @teacher = create(:user, role: 'teacher')
  end

  scenario 'teacher create first course' do
    given_logged_in_as(@teacher)
    visit onboarding_new_course_path
    fill_course_form
    attach_files
    click_on I18n.t('.onboarding.new_course.continue')
    course = Course.last
    expect(page.current_path).to eq(onboarding_select_users_path(course.id))
  end

  def fill_course_form
    fill_in('course_title', with: Faker::Name.title)
    fill_in('course_silabus', with: Faker::Lorem.paragraph(2))
    find("option[value='Private']").click
    fill_in('course_init_date', with: DateTime.now)
  end

  def attach_files
    attach_file('course_avatar', Rails.root + "spec/fixtures/files/images/palm.png")
    attach_file('course_coverphoto', Rails.root + "spec/fixtures/files/images/palm.png")
  end
end
