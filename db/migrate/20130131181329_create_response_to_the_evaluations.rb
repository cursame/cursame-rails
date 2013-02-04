class CreateResponseToTheEvaluations < ActiveRecord::Migration
  def change
    create_table :response_to_the_evaluations do |t|
      t.string :name
      t.text :comment_for_rubre
      t.integer :assignment_id
      t.integer :course_id
      t.integer :evaluation_porcentage
      t.integer :rub_calification

      t.timestamps
    end
  end
end
