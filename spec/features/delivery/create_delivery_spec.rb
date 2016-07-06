require 'rails_helper'

RSpec.feature 'Create homeworks' do
  background do
    @network = create(:network)
    @user = create(:user, :completed_onboarding, role: 'teacher')
    create_course
    given_logged_in_as(@user)
    fill_in("password", with: 'password')
    visit course_path(@course.id)
    find(:css, '.i-delivery-post').click
    fill_homework_form
  end

  scenario 'creates delivery with nil end_date', js: true do
    click_on I18n.t('deliveries.delivery_compart_form.publish')
    page.has_text?(I18n.t('deliveries.correct_create'))
  end

  scenario 'creates delivery with false final_grade', js: true do
    fill_in('delivery[end_date]', with: Date.today + 3)
    find(:css, '#delivery_final_grade').set(false)
    click_on I18n.t('deliveries.delivery_compart_form.publish')
    page.has_text?(I18n.t('deliveries.correct_create'))
  end

  def create_course
    @course = create(:course, network_id: @network.id)
    create(:members_in_course, user_id: @user.id, course_id: @course.id, accepted: true, owner: true, network_id: @network.id)
  end

  def fill_homework_form
    fill_in('delivery[title]', with: 'title')
    fill_in('delivery[description]', with: 'description')
    fill_in('delivery[publish_date]', with: Date.today + 2)
  end
end
