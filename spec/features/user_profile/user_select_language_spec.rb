require 'rails_helper'

RSpec.feature 'Select language for User platform' do
  background do
    FactoryGirl.create(:network, multilanguage: true)
    @user = FactoryGirl.create(:user, role: 'student')
    @lang = FactoryGirl.create(:language)
    given_logged_in_as(@user)
    visit '/users/edit'
  end

  scenario 'Prompt the combo box to change the language' do
    expect(page).to have_select('user_user_language_attributes_language_id',
      with_options: [@lang.name])
    expect(page).to have_content I18n.t('registrations.edit.change_lang_user')
  end
end
