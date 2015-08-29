require 'rails_helper'

RSpec.feature 'Load the custom language in network' do

  scenario 'The platform displays in the :en language' do
    net = FactoryGirl.create(:network, language: 'en')
    user = create(:user)
    given_logged_in_as(user)
    visit root_path
    lang = I18n.locale.to_s
    expect(lang).to eq("en")
  end

  scenario 'The platform displays in the :es language' do
    net = FactoryGirl.create(:network, language: 'es')
    user = create(:user)
    given_logged_in_as(user)
    visit root_path
    lang = I18n.locale.to_s
    expect(lang).to eq("es")
  end

  scenario 'The platform dont displays in the :en language' do
    net = FactoryGirl.create(:network, language: 'es')
    user = create(:user)
    given_logged_in_as(user)
    visit root_path
    lang = I18n.locale.to_s
    expect(lang).not_to be == "en"
  end
end

