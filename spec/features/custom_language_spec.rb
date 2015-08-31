require 'rails_helper'

RSpec.feature 'Load the custom language in network' do

  scenario 'The platform displays in the :en language' do
    verify_lang('en')
  end

  scenario 'The platform displays in the :es language' do
    verify_lang('es')
  end

  scenario 'Display the sign_in view in the prefered language' do
    net = create(:network, language: 'en')
    visit sign_in_path
    expect(page).to have_content 'Log in'
  end

  def verify_lang(language)
    net = FactoryGirl.create(:network, language: language)
    user = create(:user)
    given_logged_in_as(user)
    visit root_path
    lang = I18n.locale.to_s
    expect(lang).to eq(language)
  end
end

