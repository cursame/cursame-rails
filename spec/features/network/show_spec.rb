require 'rails_helper'

RSpec.feature 'User sees network'  do
  background do
    @network = create(:network)
    @user = create(:user, :completed_onboarding, role: 'teacher')
    create_course
    create_homework
    create_survey
    create_discussion
    create_comment
    create_google_form
    given_logged_in_as(@user)
    fill_in("password", with: 'password')
  end

  scenario 'filter only deliveries', js: true do
    page.execute_script("$('#filter_deliveries').click()")
    expect(page).to have_selector('.post_publication', count: 1)
    expect(page).to have_content @homework.title
  end

  scenario 'filter only surveys', js: true do
    page.execute_script("$('#filter_surveys').click()")
    expect(page).to have_selector('.post_publication', count: 1)
    expect(page).to have_content @survey.name
  end

  scenario 'filter only discussions', js: true do
    page.execute_script("$('#filter_discussions').click()")
    expect(page).to have_selector('.post_publication', count: 1)
    expect(page).to have_content @discussion.title
  end

  scenario 'filter only comments', js: true do
    page.execute_script("$('#filter_comments').click()")
    expect(page).to have_selector('.post_publication', count: 1)
    expect(page).to have_content @comment.title
  end

  scenario 'filter only google_forms', js: true do
    page.execute_script("$('#filter_google_forms').click()")
    expect(page).to have_selector('.post_publication', count: 1)
    expect(page).to have_content @google_form.title
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

  def create_survey
    @survey = build(:survey, user_id: @user.id, network_id: @network.id)
    @survey.courses = [@course]
    @survey.questions = [create_question]
    @survey.save!
  end

  def create_question
    @question = build(:question, survey_id: @survey.id)
    @question.answers = [create_answer]
    @question.save!
    @question
  end

  def create_answer
    create(:answer, question_id: @question.id)
  end

  def create_discussion
    @discussion = build(:discussion, user_id: @user.id, network_id: @network.id)
    @discussion.courses = [@course]
    @discussion.save!
  end

  def create_comment
    @comment = create(:comment, user: @user, commentable: @user, network: @network)
  end

  def create_google_form
    @google_form = build(:google_form, pollable: @network, user: @user)
    @google_form.roles = [Role.teacher]
    @google_form.save!
  end
end
