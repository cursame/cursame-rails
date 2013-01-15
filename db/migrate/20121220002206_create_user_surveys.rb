class CreateUserSurveys < ActiveRecord::Migration
  def change
    create_table :user_surveys do |t|
      t.integer :survey_id
      t.integer :user_id
      t.float :result

      t.timestamps
    end
  end
end
