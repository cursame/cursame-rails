class AddActiveColumnToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :active, :boolean, :default => 1

  end
  def self.down
    remove_column :notifications, :active
  end
end
