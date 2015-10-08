require 'rails_helper'

RSpec.feature 'Catalogs Views:' do
  background do
    @network = create(:network)

    @superadmin = create(:user, role: "superadmin")
    @catalog = create(:catalog, csv_file: prepare_file("valid.csv"),
                      status: 'rejected')

    given_logged_in_as(@superadmin)
    visit "/superadmin_panel/networks"
    click_on I18n.t('superadmin_panel.shared.sidebar.import_users')
  end

  scenario "get #index" do
    expect(page).to have_css("table.data-table tr", count: 2)
  end

  scenario "delete #index" do
    find(".catalog-id-#{@catalog.id}").click_on I18n.t('superadmin_panel.catalogs.index.destroy')
    expect(page).to have_css("table.data-table tr", count: 1)
  end

end
