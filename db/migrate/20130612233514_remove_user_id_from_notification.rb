class RemoveUserIdFromNotification < ActiveRecord::Migration
  def up
    remove_column :notifications, :user_id
  end

  def down
    add_column :notifications, :user_id, :integer
  end
end
