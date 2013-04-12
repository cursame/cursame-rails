class AddPublicToWalls < ActiveRecord::Migration
  def change
    add_column :walls, :public, :boolean, :default => false
  end
  def down
    remove_column :walls, :public
  end
end
