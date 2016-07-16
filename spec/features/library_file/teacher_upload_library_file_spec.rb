require 'rails_helper'

RSpec.feature 'Upload a library file'  do
  background do
    @network = create(:network)
    @user = create(:user, :completed_onboarding, role: 'teacher')
    given_logged_in_as(@user)
  end

  scenario 'When teacher upload library file to personal library' do
    visit user_library_path(@user.personal_url)
    click_on I18n.t('libraries.shared.header.upload_file')
    fill_form_library_file
    click_on I18n.t('library_files.shared.form.send')

    visit user_library_path(@user.personal_url)
    expect(page).to have_content 'filename'
  end

  def fill_form_library_file
    fill_in('library_file_name', with: 'filename')
    fill_in('library_file_description', with: 'description_file')
    attach_file('library_file_file', File.join(Rails.root, '/public/videos/video.mp4'))
  end
end
