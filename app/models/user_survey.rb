class UserSurvey < ActiveRecord::Base
	belongs_to :survey
	belongs_to :user
	has_many :user_survey_responses
end
