class AddLikesToPublications < ActiveRecord::Migration
  def change
    add_column :comments, :likes, :integer
    add_column :discussions, :likes, :integer
    add_column :surveys, :likes, :integer
    add_column :deliveries, :likes, :integer
  end
end
