class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :description_use
      t.integer :value
      t.boolean :avtive
      t.integer :role_id

      t.timestamps
    end
  end
end
