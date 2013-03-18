class CreateFriendships < ActiveRecord::Migration

  def up
    if (ActiveRecord::Base.connection.table_exists?("friendships")) then
      drop_table :friendships
    end

    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :accepted
      t.timestamps
    end
  end

  def down
    if (ActiveRecord::Base.connection.table_exists?("friendships")) then
      drop_table :friendships
    end
  end
end
