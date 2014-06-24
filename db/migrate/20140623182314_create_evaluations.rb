class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.string :qualifying_id
      t.string :qualifying_type
      t.integer :score,               default: 0
      t.text :feedback,               default: ""

      t.timestamps
    end
  end
end
