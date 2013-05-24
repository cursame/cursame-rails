class RemoveLikesToWalls < ActiveRecord::Migration
  def change
    remove_column :walls, :likes
  end
  def down
  	add_column :walls, :likes
  end
end
