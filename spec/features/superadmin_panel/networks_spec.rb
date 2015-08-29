require 'rails_helper'

RSpec.feature 'Networks Views:' do
  background do
    @network = FactoryGirl.create(:network)
    @superadmin = FactoryGirl.create(:user, role: "superadmin")
    given_logged_in_as(@superadmin)
    visit "/superadmin_panel/networks"
  end

  scenario "Get #index" do
    click_on I18n.t('superadmin_panel.shared.sidebar.networks')
    expect(page).to have_css("table.data-table tr", count: 2)
  end

  scenario "Get #show" do
    locale_root = 'superadmin_panel.networks'
    find(".networks-id-#{@network.id}").click_on I18n.t("#{locale_root}.index.view")
    expect(page).to have_text @network.name
    expect(page).to have_text @network.subdomain
    expect(page).to have_text @network.population
    expect(page).to have_text @network.welcom_message if @network.welcom_message
    expect(page).to have_text I18n.t("#{locale_root}.show.#{@network.public_register?}")
  end
end
