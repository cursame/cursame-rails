require 'rails_helper'

RSpec.feature 'Edit questionnaire' do
  background do
    @network = create(:network)
    @user = create(:user, role: 'teacher')
  end

  scenario 'Success edit' do
    create_course
    create_questionnaire
    given_logged_in_as(@user)
    navigate_to_edit_questionnaire
    fill_questionnaire_edit_form
    click_on I18n.t('surveys.edit.save')
    page.has_text?(I18n.t('surveys.correct_edit'))
  end

  def create_course
    @course = create(:course, network_id: @network.id)
    create(:members_in_course, user_id: @user.id, course_id: @course.id, accepted: true, owner: true, network_id: @network.id)
  end

  def create_questionnaire
    @quiz = build(:survey, network_id: @network.id, user_id: @user.id)
    @quiz.courses = [@course]
    question = create_question
    @quiz.questions = [question]
    @quiz.save!
  end

  def create_question
    @enquiry = build(:question, survey_id: @quiz.id)
    @enquiry.answers = [create_answer]
    @enquiry.save!
    @enquiry
  end

  def create_answer
    create(:answer, question_id: @enquiry.id)
  end

  def navigate_to_edit_questionnaire
    visit evaluate_activities_path
    expect(page).to have_content(@quiz.name)
    click_on @quiz.name
    click_on I18n.t('evaluate.shared.header_activity_survey.edit')
  end

  def fill_questionnaire_edit_form
    fill_in('survey_name', with: 'title' )
    fill_in('survey_publish_date', with: Date.today + 2)
    fill_in('survey_end_date', with: Date.today + 4 )
  end
end
