require 'rails_helper'

RSpec.feature 'View index courses' do
  background do
    @network = create(:network)
    @admin = create(:user, role: 'admin')
    @teacher = create(:user, role: 'teacher')
  end

  scenario 'Show all courses to admin user', js: true do
    courses = create_courses(@teacher, @network)
    course_titles = course_titles(courses)
    given_logged_in_as(@admin)
    fill_in("password", with: 'password')
    visit courses_path
    page.execute_script "window.scrollBy(0,10000)"
    expect_all_courses course_titles
  end

  def create_courses(teacher, network)
    courses = []
    (COURSES_PER_PAGE + 1).times do
     courses << create_course(teacher, network)
    end
    courses
  end

  def course_titles courses
    courses.map { |course| course.title}
  end

  def expect_all_courses titles
    titles.each do |title|
      expect(page).to have_css('h3', text: title)
    end
  end

end
