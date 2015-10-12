require 'rails_helper'

RSpec.feature 'Catalogs Views:' do
  background do
    @network = create(:network)

    @superadmin = create(:user, role: "superadmin")
    @catalog = create(:catalog, csv_file: prepare_file("valid.csv"),
                      status: 'rejected')

    @catalog_error = create(:catalog_error, catalog_id: @catalog.id)

    given_logged_in_as(@superadmin)
    visit "/superadmin_panel/networks"
    click_on I18n.t('superadmin_panel.shared.sidebar.import_users')
  end

  scenario "get #index" do
    expect(page).to have_css("table.data-table tr", count: 2)
  end

  scenario "post #create" do
    click_on I18n.t('superadmin_panel.catalogs.index.create')

    attach_file 'catalog_csv_file', prepare_file("valid.csv").path
    click_on I18n.t('superadmin_panel.catalogs.new.import_users')

    expect(page.status_code).to eq(200)
  end

  scenario "get #show" do
    find(".catalog-id-#{@catalog.id}").click_on I18n.t('superadmin_panel.catalogs.index.view')
    expect_catalog_show_texts
    expect_catalog_error_show_texts
  end

  scenario "delete #index" do
    find(".catalog-id-#{@catalog.id}").click_on I18n.t('superadmin_panel.catalogs.index.destroy')
    expect(page).to have_css("table.data-table tr", count: 1)
  end

  def expect_catalog_show_texts
    status_field = I18n.t("superadmin_panel.catalogs.index.status.#{@catalog.status}")
    expect(page).to have_text status_field

    expect(page).to have_text @catalog.csv_file.file.filename
    expect(page).to have_text @catalog.domain
  end

  def expect_catalog_error_show_texts
    field_text = I18n.t("superadmin_panel.catalogs.show.error_field.#{@catalog_error.field}")
    expect(page).to have_text field_text

    expect(page).to have_text @catalog_error.row
    expect(page).to have_text @catalog_error.email
    expect(page).to have_text @catalog_error.errors_message
  end

end
