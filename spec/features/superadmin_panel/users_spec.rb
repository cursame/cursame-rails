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

  scenario "get #show" do
    find(".user-id-#{@user.id}").click_on I18n.t('superadmin_panel.users.index.view')
    expect_user_show_texts(@user, @user.roles.first.title)
  end

  scenario "get #show mentor_link" do
    find(".user-id-#{@mentor_link.id}").click_on I18n.t('superadmin_panel.users.index.view')
    expect(page).to have_text @mentor_link.permissionings.first.entity_id
    expect(page).to have_text @mentor_link.permissionings.first.entity_name
  end

  scenario "post #create" do
    click_on I18n.t('superadmin_panel.users.index.create')

    user = FactoryGirl.build(:user)
    role_title = %w(superadmin admin teacher student).sample
    fill_user_form(user, role_title, 'testing')

    click_on 'action-button'
    expect_user_show_texts(user, role_title)
  end

  scenario "post #create mentor_link" do
    click_on I18n.t('superadmin_panel.users.index.create')

    FactoryGirl.create(:network, subdomain: 'meems')
    user = FactoryGirl.build(:user)
    entity = fill_user_form(user, "mentor_link", 'meems')

    click_on 'action-button'
    expect(page).to have_text entity[:id]
    expect(page).to have_text entity[:name]
  end

  scenario "put #update" do
    find(".user-id-#{@user.id}").click_on I18n.t('superadmin_panel.users.index.edit')

    user = FactoryGirl.build(:user)
    user.email = @user.email
    role_title = %w(superadmin admin teacher student).sample
    fill_user_form(user, role_title, 'testing')

    click_on 'action-button'
    expect_user_show_texts(user, role_title)
  end

  scenario "put #update mentor_link" do
    find(".user-id-#{@user.id}").click_on I18n.t('superadmin_panel.users.index.edit')

    FactoryGirl.create(:network, subdomain: 'meems')
    user = FactoryGirl.build(:user)
    user.email = @user.email
    entity = fill_user_form(user, 'mentor_link', 'meems')

    click_on 'action-button'
    expect(page).to have_text entity[:id].to_i
    expect(page).to have_text entity[:name]
  end

  def expect_user_show_texts(user, role_title)
    expect(page).to have_text user.email
    expect(page).to have_text I18n.t("roles.#{role_title}")
    expect(page).to have_text user.first_name
    expect(page).to have_text user.last_name
    expect(page).to have_text user.subdomain
  end

  def fill_user_form(user, role_title, network_subdomain)
    fill_in('user_email', with: user.email)
    fill_in('user_first_name', with: user.first_name)
    fill_in('user_last_name', with: user.last_name)
    fill_in('user_password', with: 'password')
    fill_in('user_network_subdomain', with: network_subdomain)

    select(I18n.t("roles.#{role_title}"), from: 'user_role_id')

    if (role_title == "mentor_link")
      entity = { id: Faker::Number.number(2), name: Faker::Lorem.word }

      fill_in('user_entity_id', with: entity[:id])
      fill_in('user_entity_name', with: entity[:name])

      entity
    end
  end
end