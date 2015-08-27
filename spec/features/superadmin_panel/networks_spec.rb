require 'rails_helper'

RSpec.feature 'Networks Views:' do
  background do
    FactoryGirl.create(:network)
    @superadmin = FactoryGirl.create(:user, role: "superadmin")
    @networks = []
    9.times.each do |i|
      @networks << FactoryGirl.create(:network, subdomain: "#{Faker::Internet.domain_word + i.to_s}")
    end
    given_logged_in_as(@superadmin)
    visit "/superadmin_panel/networks"
  end

  scenario "Get #index" do
    click_on I18n.t('superadmin_panel.shared.sidebar.networks')
    expect(page).to have_css("table.data-table tr", count: 11)
  end
end
