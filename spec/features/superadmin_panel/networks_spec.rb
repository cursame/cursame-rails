require 'rails_helper'

RSpec.feature 'Networks Views:' do
  background do
    @network_testing = FactoryGirl.create(:network)
    @network = FactoryGirl.create(:network, subdomain: Faker::Internet.domain_word)

    @superadmin = FactoryGirl.create(:user, role: "superadmin")
    given_logged_in_as(@superadmin)
    visit "/superadmin_panel/networks"
  end

  scenario "Get #index" do
    click_on I18n.t('superadmin_panel.shared.sidebar.networks')
    expect(page).to have_css("table.data-table tr", count: 3)
  end

  scenario "Get #show" do
    locale_root = 'superadmin_panel.networks'
    find(".networks-id-#{@network_testing.id}").click_on I18n.t("#{locale_root}.index.view")

    expect_network_show_texts(@network_testing)
  end

  scenario "post #create" do
    click_on I18n.t('superadmin_panel.networks.index.create')

    network = FactoryGirl.build(:network, subdomain: Faker::Internet.domain_word)
    fill_network_form(network)

    click_on 'action-button'
    expect_network_show_texts(network)
  end

  scenario "put #update" do
    locale_root = 'superadmin_panel.networks'
    find(".networks-id-#{@network.id}").click_on I18n.t("#{locale_root}.index.edit")

    network = FactoryGirl.build(:network, subdomain: Faker::Internet.domain_word)
    fill_network_form(network)

    click_on 'action-button'
    expect_network_show_texts(network)
  end
end
