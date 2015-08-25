require 'rails_helper'

RSpec.feature 'Users Views:' do
  background do
    FactoryGirl.create(:network)
    @superadmin = FactoryGirl.create(:user, role: "superadmin")
    @users = []
    9.times.each do |i|
      @users << FactoryGirl.create(:user, role: %w(admin student operator teacher).sample)
    end
    given_logged_in_as(@superadmin)
    visit "/superadmin_panel/networks"
  end

  scenario "Get #index" do
    click_on I18n.t('superadmin_panel.shared.sidebar.users')
    expect(page).to have_css("table.data-table tr", count: 11)
  end
end
