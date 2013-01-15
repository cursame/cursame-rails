class CreateAreasOfEvaluations < ActiveRecord::Migration
  def change
    create_table :areas_of_evaluations do |t|
      t.string :name
      t.string :description
      t.integer :assignment_id
      t.integer :evaluation_percentage
      t.boolean :active
      t.datetime :date_of_item

      t.timestamps
    end
  end
end
