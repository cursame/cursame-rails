class AddFriendTwoToUserFriends < ActiveRecord::Migration
  def change
    add_column :user_friends, :friend_two, :integer

  end
end
