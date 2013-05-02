class UserSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user
  has_many :user_survey_responses, :dependent => :destroy
  has_many :activities, as: :activitye, :dependent => :destroy

  accepts_nested_attributes_for :user_survey_responses, :reject_if => lambda { |a| a[:answer_id].blank? }, :allow_destroy => true



  after_create do
    self.survey.courses.each do
      |course|
      teachers = course.members_in_courses.keep_if {
        |member|
        member.owner == true
      }

      teachers.each do
        |teacher|
        teacher.user.settings_teacher.increment_surveys if !teacher.user.settings_teacher.nil?
      end
    end
  end

  #
  # Calcula la calificacion de la evaluacion
  #
  def evaluation
    responses = self.user_survey_responses
    correct_answers = 0.0
    responses.each do |response|
      answer = Answer.find(response.answer_id)
      correct_answers += 1 if answer.correct
    end
    self.update_attributes(:result => (correct_answers/responses.size)*100)
    return (correct_answers/responses.size)*100
  end

  def title
    'respuesta ' + survey.name
  end
end
