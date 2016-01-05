require 'rails_helper'

RSpec.feature 'Edit homeworks' do
  background do
    @network = create(:network)
    @user = create(:user, role: 'teacher')
  end

  scenario 'Success edit' do
    create_course
    create_homework
    given_logged_in_as(@user)
    navigate_to_edit_homework
    verify_time_zone_dates
    fill_homework_edit_form
    click_on I18n.t('deliveries.edit.save')
    page.has_text?(I18n.t('deliveries.correct_edit'))
  end

  def create_course
    @course = create(:course, network_id: @network.id)
    create(:members_in_course, user_id: @user.id, course_id: @course.id, accepted: true, owner: true, network_id: @network.id)
  end

  def create_homework
    @homework = build(:delivery, user_id: @user.id, network_id: @network.id)
    @homework.courses = [@course]
    @homework.save!
  end

  def navigate_to_edit_homework
    visit evaluate_activities_path
    expect(page).to have_content(@homework.title)
    click_on @homework.title
    click_on I18n.t('evaluate.shared.header_activity_delivery.edit_delivery')
  end

   def fill_homework_edit_form
     fill_in('delivery_title', with: 'title')
     fill_in('delivery_description', with: 'description')
     fill_in('delivery_publish_date', with: Date.today + 2)
     fill_in('delivery_end_date', with: Date.today + 4)
   end

  def verify_time_zone_dates
    expect(page.find_field(I18n.t('deliveries.edit.homework_publish_date')).value).to eq @homework.publish_date.to_s
    expect(page.find_field(I18n.t('deliveries.edit.homework_end_date')).value).to eq @homework.end_date.to_s
  end
end
