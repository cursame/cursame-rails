class UserSurvey < ActiveRecord::Base
	belongs_to :survey
	belongs_to :user
	has_many :user_survey_responses
	accepts_nested_attributes_for :user_survey_responses, :reject_if => lambda { |a| a[:answer_id].blank? }, :allow_destroy => true
end
