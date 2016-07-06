require 'rails_helper'

RSpec.feature 'Create discussions' do
  background do
    @network = create(:network)
    @user = create(:user, :completed_onboarding, role: 'teacher')
  end

  scenario 'creates discussion with nil end_date', js: true do
    create_course
    given_logged_in_as(@user)
    fill_in("password", with: 'password')
    visit course_path(@course.id)
    find(:css, '.i-discussion-post').click
    fill_discussion_form
    click_on I18n.t('discussions.form_for_discussion.create_discuss')
    page.has_text?(I18n.t('discussions.create_discuss'))
  end

  def create_course
    @course = create(:course, network_id: @network.id)
    create(:members_in_course, user_id: @user.id, course_id: @course.id, accepted: true, owner: true, network_id: @network.id)
  end

  def fill_discussion_form
    fill_in('discussion[title]', with: 'title')
    fill_in('discussion[description]', with: 'description')
    find(:css, "#discussion_evaluable").set(true)
    fill_in('discussion[publish_date]', with: Date.today + 2)
  end
end
