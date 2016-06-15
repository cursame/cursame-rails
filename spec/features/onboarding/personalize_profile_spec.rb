require 'rails_helper'

RSpec.feature 'Personalize profile' do
  background do
    @network = create(:network)
    @student = create(:user, role: 'student')
    @teacher = create(:user, role: 'teacher')
  end

  scenario 'render Onboarding profile page when logged first time with Teacher' do
    given_logged_in_as(@teacher)
    render_onboarding_user_profile
    fill_user_form
    attach_files
    click_on I18n.t('.onboarding.user_profile.continue')
    expect(page.current_path).to eq(onboarding_tour_video_path)
  end

  scenario 'render Onboarding profile page when logged first time with Student' do
    given_logged_in_as(@student)
    render_onboarding_user_profile
    fill_user_form
    attach_files
    click_on I18n.t('.onboarding.user_profile.continue')
    expect(page.current_path).to eq(onboarding_friendship_path)
  end

  def render_onboarding_user_profile
    visit onboarding_profile_path
    expect(page).to have_content(I18n.t('.onboarding.user_profile.welcome_to_cursame'))
    expect(page).to have_content(I18n.t('.onboarding.user_profile.user_profile_step'))
    expect(page).to have_content(I18n.t('.onboarding.user_profile.user_profile_step_description'))
  end

  def fill_user_form
    fill_in('user_first_name', with: 'first_name')
    fill_in('user_last_name', with: 'last_name')
    fill_in('user_bios', with: 'My Bio')
    fill_in('user_twitter_link', with: '@twitter_account')
    fill_in('user_personal_url', with: 'user_url')
  end

  def attach_files
    attach_file(I18n.t('.onboarding.user_profile.avatar'), Rails.root + "spec/fixtures/files/images/palm.png")
    attach_file(I18n.t('.onboarding.user_profile.coverphoto'), Rails.root + "spec/fixtures/files/images/palm.png")
  end
end
