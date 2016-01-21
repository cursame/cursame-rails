require 'rails_helper'

RSpec.feature 'Edit discussion' do
  background do
    @network = create(:network)
    @user = create(:user, :completed_onboarding, role: 'teacher')
  end

  scenario 'Success edit' do
    create_course
    create_discussion
    given_logged_in_as(@user)
    navigate_to_edit_discussion
    fill_discussion_edit_form
    click_on I18n.t('discussions.edit.save_discussion')
    page.has_text?(I18n.t('discussions.correct_edit'))
  end

  def create_course
    @course = create(:course, network_id: @network.id)
    create(:members_in_course, user_id: @user.id, course_id: @course.id, accepted: true, owner: true, network_id: @network.id)
  end

  def create_discussion
    @discussion = create(:discussion, network_id: @network.id, user_id: @user.id, evaluable: true )
    create(:discussion_course, discussion_id: @discussion.id, course_id: @course.id)
  end

  def fill_discussion_edit_form
    fill_in('discussion_title', with: 'title')
    fill_in('discussion_description', with: 'description')
    fill_in('discussion_publish_date', with: Date.today + 2)
    fill_in('discussion_end_date', with: Date.today + 4)
  end

  def navigate_to_edit_discussion
    visit evaluate_activities_path
    expect(page).to have_content(@discussion.title)
    click_on @discussion.title
    click_on I18n.t('evaluate.discussions.evaluate_discussions_header.edit_discussion')
  end
end
