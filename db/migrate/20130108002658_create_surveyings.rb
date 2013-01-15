class CreateSurveyings < ActiveRecord::Migration
  def change
    create_table :surveyings do |t|
      t.integer :course_id
      t.integer :survey_id

      t.timestamps
    end
  end
end
