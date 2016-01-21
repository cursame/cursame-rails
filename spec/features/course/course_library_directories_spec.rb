require 'rails_helper'

RSpec.feature 'Course library directories' do
  background do
    @network = create(:network)
    @teacher = create(:user, :completed_onboarding, role: 'teacher')
    @course = create_course(@teacher, @network)
  end

  scenario 'Create a directory in course library' do
    given_logged_in_as(@teacher)
    navigate_to_course
    click_on (I18n.t('library_directories.shared.header.create_folder'))
    fill_folder_form
    click_on (I18n.t('library_directories.shared.form.send'))
    expect(page).to have_content('library_title')
  end

  def fill_folder_form
    fill_in('library_directory_name', with: 'library_title')
    fill_in('library_directory_description', with: 'library_description')
  end

  def navigate_to_course
    visit course_path(@course.id)
    click_on (I18n.t('courses.shared.course_header.library'))
    page.has_text?(I18n.t('library_directories.shared.list.no_documents'))
  end
end
