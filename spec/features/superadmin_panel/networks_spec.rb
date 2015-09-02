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

  def expect_network_show_texts(network)
    expect(page).to have_text network.name
    expect(page).to have_text network.subdomain
    expect(page).to have_text network.population
    expect(page).to have_text network.welcom_message if network.welcom_message

    locale_root = 'superadmin_panel.networks'
    expect(page).to have_text I18n.t("#{locale_root}.show.#{network.public_register?}")
  end

  def fill_network_form(network)
    fill_in('network_name', with: network.name)
    fill_in('network_subdomain', with: network.subdomain)
    fill_in('network_welcom_message', with: network.welcom_message)
    fill_in('network_population', with: network.population)

    public_register = I18n.t("superadmin_panel.networks.shared.form.#{network.public_register}")
    select(public_register, from: 'network_public_register')
  end

end
