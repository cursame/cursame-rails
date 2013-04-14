class AddLikesToWalls < ActiveRecord::Migration
  def change
    add_column :walls, :likes, :integer
  end
end
