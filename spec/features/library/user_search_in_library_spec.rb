require 'rails_helper'

RSpec.feature 'Search in library'  do
  background do
    @network = create(:network)
    @teacher = create(:user, :completed_onboarding, role: 'teacher')
    @student = create(:user, :completed_onboarding, role: 'student')
    @course = create(:course, network: @network)
  end

  scenario 'When teacher search file in personal library' do
    given_logged_in_as(@teacher)
    visit user_library_path(@teacher.personal_url)
    directory = create(:library_directory, location: @teacher.library)
    file = create(:library_file, location: directory)
    search(file.name)
    expect(page).to have_content file.name
  end

  scenario 'When teacher search directory in personal library' do
    given_logged_in_as(@teacher)
    visit user_library_path(@teacher.personal_url)
    directory = create(:library_directory, location: @teacher.library)
    nested_directory = create(:library_directory, location: directory)
    search(nested_directory.name)
    expect(page).to have_content nested_directory.name
  end

  scenario 'When student search file in course library' do
    student_visit_course_library
    directory = create(:library_directory, location: @course.library)
    file = create(:library_file, location: directory)
    search(file.name)
    expect(page).to have_content file.name
  end

  scenario 'When student search directory in course library' do
    student_visit_course_library
    directory = create(:library_directory, location: @course.library)
    nested_directory = create(:library_directory, location: directory)
    search(nested_directory.name)
    expect(page).to have_content nested_directory.name
  end

  def student_visit_course_library
    given_logged_in_as(@student)
    create(:members_in_course, user: @student, course: @course, accepted: true, network: @network)
    visit library_in_course_path(@course.id)
  end

  def search(query)
    fill_in('search-query', with: query)
    find('input[name="commit"]').click
  end
end
