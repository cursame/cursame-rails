class UserSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user

  has_many :user_survey_responses, dependent: :destroy
  has_many :activities, as: :activitye, dependent: :destroy

  has_one :grade, as: :gradable, dependent: :destroy

  accepts_nested_attributes_for :user_survey_responses, reject_if: lambda { |a| a[:answer_id].blank? }, :allow_destroy true

  after_create do
    self.survey.courses.each do |course|
      teachers = course.members_in_courses.keep_if { |member| member.owner == true }
      if !(teachers.nil?) then
        teachers.each { |teacher| teacher.user.settings_teacher.increment_surveys if !teacher.user.settings_teacher.nil? }
        teacher_users = teachers.map { |t| t.user}
        Notification.create notificator: self, users: teacher_users, kind: "new_assignment_on_survey", active: true
      end
    end
    grade = Grade.create gradable: self, score: 0, user_id: self.user_id
    self.grade = grade
  end

  # Calcula la calificacion de la evaluacion
  def evaluation
    responses = self.user_survey_responses
    correct_answers = 0.0
    responses.each do |response|
      answer = Answer.find(response.answer_id)
      correct_answers += 1 if answer.correct
    end
    if self.grade.nil?
      self.grade = Grade.create score: 0, gradable: self, user_id: self.user_id
    end
    if (responses.size != 0) then
      evaluation = (correct_answers/responses.size)*100.to_f
      self.update_attributes result: evaluation
      if evaluation.to_i != grade.score
        self.grade.update_attributes score: evaluation.to_i
      end
      return evaluation
    else
      self.update_attributes result: 0.0
      if grade.score != 0
        self.grade.update_attributes score: 0, gradable: self
      end
      return 0.0
    end
  end

  def title
    'respuesta ' + survey.name
  end
end
