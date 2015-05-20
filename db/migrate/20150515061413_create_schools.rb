class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :cct
      t.string :name
      t.string :subsystem
      t.integer :entity_id
      t.string :entity_name
      t.integer :municipality_id
      t.string :municipality_name

      t.timestamps
    end
  end
end
