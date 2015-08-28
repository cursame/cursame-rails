require 'rails_helper'

RSpec.feature 'Users Views:' do
  background do
    FactoryGirl.create(:network)
    @superadmin = FactoryGirl.create(:user, role: "superadmin")
    @user = FactoryGirl.create(:user, role: %w(admin student operator teacher).sample)
    @mentor_link = FactoryGirl.create(:user, role: "mentor_link")
    given_logged_in_as(@superadmin)
    visit "/superadmin_panel/networks"
    click_on I18n.t('superadmin_panel.shared.sidebar.users')
  end

  scenario "get #index" do
    expect(page).to have_css("table.data-table tr", count: 4)
  end

  scenario "Get #show" do
    find(".user-id-#{@user.id}").click_on I18n.t('superadmin_panel.users.index.view')
    expect(page).to have_text @user.email
    expect(page).to have_text I18n.t("roles.#{@user.permissionings.first.role.title}")
    expect(page).to have_text @user.facebook_link
    expect(page).to have_text @user.twitter_link
    expect(page).to have_text @user.description
  end

  scenario "Get #show mentor_link" do
    find(".user-id-#{@mentor_link.id}").click_on I18n.t('superadmin_panel.users.index.view')
    expect(page).to have_text @mentor_link.permissionings.first.entity_id
    expect(page).to have_text @mentor_link.permissionings.first.entity_name
  end
end
