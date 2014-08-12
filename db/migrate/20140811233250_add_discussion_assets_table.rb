class AddDiscussionAssetsTable < ActiveRecord::Migration
  def up
  	create_table :discussion_assets do |t|
      t.integer :asset_id
      t.integer :discussion_id
      t.timestamps
    end
    add_index :discussion_assets, :asset_id
    add_index :discussion_assets, :discussion_id
  end

  def down
  	drop_table :discussion_assets
  end
end
