class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.integer :publication_id
      t.string :publication_type

      t.timestamps
    end
  end
end
