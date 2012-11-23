class AddFriendOneToUserFriends < ActiveRecord::Migration
  def change
    add_column :user_friends, :friend_one, :integer

  end
end
