require 'rails_helper'

RSpec.feature 'Delete a library file'  do
  background do
    @network = create(:network)
    @user = create(:user, :completed_onboarding, role: 'teacher')
    @not_owner_user = create(:user)
  end

  scenario 'When the user upload a file, then deleted succesfully' do
    upload_library_file(@network, @user)
    delete_library_file
  end

  scenario 'If the user dont upload the file, then do not delete them' do
    upload_library_file(@network, @user)
    user_doesnt_delete_file
  end

  def delete_library_file
    given_logged_in_as(@user)
    visit library_path(@network.library)
    click_link I18n.t('library_files.shared.standalone_card.delete_file')
    expect(page).to have_content I18n.t('library_directories.shared.list.no_documents')
  end

  def user_doesnt_delete_file
    given_logged_in_as(@not_owner_user)
    visit library_path(@network.library)
    expect(page).to have_no_content I18n.t('library_files.shared.standalone_card.delete_file')
  end
end
