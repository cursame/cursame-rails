class UserSurveyResponse < ActiveRecord::Base
  belongs_to :user_survey
  belongs_to :question
  has_many :correct_answers,  :class_name  => 'Answer',  :foreign_key => :answer_id
end
