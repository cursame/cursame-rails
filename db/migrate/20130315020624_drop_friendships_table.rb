class DropFriendshipsTable < ActiveRecord::Migration
  def up
    drop_table :friendships
  end

  def down
  end
end
