require 'rails_helper'

RSpec.feature 'Logs in:' do
  background do
    @network = create(:network)
  end

  scenario "fails to log in with an invalid account" do
    @user = create(:user)
    visit new_user_session_path
    fill_the_form_with(@user.email, "wrong_password")
    click_on("sign_in")
    page.has_text?(I18n.t('usessions_controller.invalid'))
  end

  scenario "succeed to log in with a teacher user completed onboarding" do
    @teacher = create(:user, :completed_onboarding, role: 'teacher')
    given_logged_in_as(@teacher)
    expect(page.current_path).to eq root_path
  end

  scenario "succeed to log in with a teacher user uncompleted onboarding" do
    @teacher = create(:user, role: 'teacher')
    given_logged_in_as(@teacher)
    expect(page).to have_content(I18n.t('.onboarding.user_profile.welcome_to_cursame'))
  end

  scenario "succeed to log in with a student user completed onboarding" do
    @student = create(:user, :completed_onboarding, role: 'student')
    given_logged_in_as(@student)
    expect(page.current_path).to eq root_path
  end

  scenario "succeed to log in with a student user uncompleted onboarding" do
    @student = create(:user, role: 'teacher')
    given_logged_in_as(@student)
    expect(page).to have_content(I18n.t('.onboarding.user_profile.welcome_to_cursame'))
  end

  scenario "succeed to log in with an admin user" do
    @admin = create(:user, role: 'admin')
    given_logged_in_as(@admin)
    expect(page.current_path).to eq root_path
  end

  def fill_the_form_with(email, password)
    fill_in("user_email", with: email)
    fill_in("user_password", with: password)
  end
end
