class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :name
      t.integer :order, unique: true
      t.timestamps
    end

    add_index :phases, :order
  end
end
