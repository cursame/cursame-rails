class RemoveResultFromUserSurvey < ActiveRecord::Migration
	def change
		UserSurvey.all.each do |user_survey|
			survey_grade = Grade.find_by_gradable_id_and_gradable_type user_survey.id, 'UserSurvey'
			if survey_grade.nil?
				grade = Grade.new
				grade.gradable_id = user_survey.id
				grade.gradable_type = 'UserSurvey'
				grade.score    = user_survey.result.to_i
				grade.user_id  = user_survey.user_id
				grade.save
			end
		end

		remove_column :user_surveys, :result

	end
end
