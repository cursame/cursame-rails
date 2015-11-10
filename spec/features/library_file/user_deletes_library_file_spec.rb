require 'rails_helper'

RSpec.feature 'Delete a library file'  do
  background do
    @network = create(:network)
    @user = create(:user, role: 'teacher')
  end

  scenario 'File deleted succesfully' do
    upload_library_file
    delete_library_file
  end

  def upload_library_file
    @library = @network.library
    @library_file = create(:library_file)
    @library_file.user_id = @user.id
    @library_file.location_id = @library.id
    @library_file.location_type = 'Library'
    @library_file.save!
  end

  def delete_library_file
    given_logged_in_as(@user)
    visit library_path(@network.library)
    click_link I18n.t('library_files.shared.standalone_card.delete_file')
    expect(page).to have_content I18n.t('library_directories.shared.list.no_documents')
  end
end
