class CreateDeliveryAssets < ActiveRecord::Migration
  def change
    create_table :delivery_assets do |t|
      t.integer :asset_id
      t.integer :delivery_id

      t.timestamps
    end
  end
end
