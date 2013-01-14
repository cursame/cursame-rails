class CreateUserSurveyResponses < ActiveRecord::Migration
  def change
    create_table :user_survey_responses do |t|
      t.integer :user_survey_id
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
