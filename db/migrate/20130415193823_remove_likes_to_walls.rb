class RemoveLikesToWalls < ActiveRecord::Migration
  def change
    remove_column :walls, :likes
  end
end
