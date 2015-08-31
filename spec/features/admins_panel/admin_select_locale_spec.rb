require 'rails_helper'

RSpec.feature 'Select locale for network' do
  background do
    FactoryGirl.create(:network)
    @admin = FactoryGirl.create(:user, role: 'admin')
    given_logged_in_as(@admin)
    visit '/managers/settings'
  end

  scenario 'Stay in configuration panel, view the combo box' do
    expect(page).to have_content I18n.t('networks.form.change_locale') #change locale
    expect(page).to have_select('network_language',
      with_options: languages)
  end

  def languages
    arr = []
    LANGUAGES.each {|e| arr << e.first}
    arr
  end
end
