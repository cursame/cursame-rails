class RemoveLikesColumnFromDiscussions < ActiveRecord::Migration
  def up
  	remove_column :discussions, :likes
  end

  def down
  	add_column :discussions, :likes, :integer
  end
end
