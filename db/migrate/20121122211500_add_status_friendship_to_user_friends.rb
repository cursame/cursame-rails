class AddStatusFriendshipToUserFriends < ActiveRecord::Migration
  def change
    add_column :user_friends, :status_friendship, :integer, :default => 0

  end
end
