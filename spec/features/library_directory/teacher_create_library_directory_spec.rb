require 'rails_helper'

RSpec.feature 'Create a library directory'  do
  background do
    @network = create(:network)
    @user = create(:user, :completed_onboarding, role: 'teacher')
    given_logged_in_as(@user)
  end

  scenario 'When teacher create library directory to personal library' do
    visit user_library_path(@user.personal_url)
    click_on I18n.t('libraries.shared.header.create_folder')
    fill_form_library_directory
    click_on I18n.t('library_directories.shared.form.send')

    visit user_library_path(@user.personal_url)
    expect(page).to have_content 'name_directory'
  end

  def fill_form_library_directory
    fill_in('library_directory_name', with: 'name_directory')
    fill_in('library_directory_description', with: 'description_directory')
  end
end
