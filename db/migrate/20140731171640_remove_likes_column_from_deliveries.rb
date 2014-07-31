class RemoveLikesColumnFromDeliveries < ActiveRecord::Migration
  def up
  	remove_column :deliveries, :likes
  end

  def down
  	add_column :deliveries, :likes, :integer
  end
end
