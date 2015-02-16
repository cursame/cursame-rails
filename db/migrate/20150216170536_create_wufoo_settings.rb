class CreateWufooSettings < ActiveRecord::Migration
  def change
    create_table :wufoo_settings do |t|
      t.integer :network_id
      t.string :api_key
      t.string :acount_name

      t.timestamps
    end
    add_index :wufoo_settings, :network_id
  end
end
