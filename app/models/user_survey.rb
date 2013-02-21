class UserSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user
  has_many :user_survey_responses
  accepts_nested_attributes_for :user_survey_responses, :reject_if => lambda { |a| a[:answer_id].blank? }, :allow_destroy => true

  def evaluation

    responses = UserSurveyResponse.where(:user_survey_id => self.id)
    correct_answers = 0.0
    responses.each do |response|
      answer = Answer.find(response.answer_id)
      correct_answers += 1 if answer.correct
    end
    self.update_attributes(:result => (correct_answers/responses.size)*100)
  end


end
