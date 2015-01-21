class CreateCursamePercentages < ActiveRecord::Migration
  def change
    create_table :cursame_percentages do |t|
      t.integer :course_id,    null: false
      t.integer :deliveries,   null: false
      t.integer :discussions,  null: false
      t.integer :surveys,      null: false
      t.integer :cursame,      null: false

      t.timestamps
    end
    add_index :cursame_percentages, :course_id
  end
end
