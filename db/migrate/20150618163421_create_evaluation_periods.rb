class CreateEvaluationPeriods < ActiveRecord::Migration
  def change
    create_table :evaluation_periods do |t|
      t.integer :course_id, null: false
      t.string :name,       null: false
      t.integer :order,     null: false
      t.string :short_name, null: false

      t.timestamps
    end
    add_index :evaluation_periods, :course_id
  end
end
