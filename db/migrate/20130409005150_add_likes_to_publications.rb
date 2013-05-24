class AddLikesToPublications < ActiveRecord::Migration
  def change
    add_column :comments, :likes, :integer
    add_column :discussions, :likes, :integer
    add_column :surveys, :likes, :integer
    add_column :deliveries, :likes, :integer
  end
  def down
    remove_column :comments, :likes
    remove_column :discussions, :likes
    remove_column :surveys, :likes
    remove_column :deliveries, :likes
  end
end
