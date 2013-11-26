class AddUserOnlineToUsers < ActiveRecord::Migration
  def change
    add_column :users, :online, :boolean, :default => false
  end
  def down
  	remove_column :users, :online, :boolean
  end
end
