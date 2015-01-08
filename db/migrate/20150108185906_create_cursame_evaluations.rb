class CreateCursameEvaluations < ActiveRecord::Migration
  def change
    create_table :cursame_evaluations do |t|
      t.integer :course_id,               null: false
      t.integer :delivery_percentages,    null: false
      t.integer :discussion_percentages,  null: false
      t.integer :survey_percentages,      null: false
      t.integer :cursame_percentages,     null: false

      t.timestamps
    end

    add_index :cursame_evaluations, :course_id
  end
end
