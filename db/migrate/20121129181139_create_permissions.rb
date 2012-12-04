class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :description_use
      t.boolean :avtive

      t.timestamps
    end
  end
end
