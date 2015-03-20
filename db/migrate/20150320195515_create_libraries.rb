class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.integer :storable_id
      t.string :storable_type
      t.references :network

      t.timestamps
    end
    add_index :libraries, :network_id
  end
end
