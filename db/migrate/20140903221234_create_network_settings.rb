class CreateNetworkSettings < ActiveRecord::Migration
  def change
    create_table :network_settings do |t|
      t.integer :network_id
      t.string :property
      t.string :value

      t.timestamps
    end
  end
end
