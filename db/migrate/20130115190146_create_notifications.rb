class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.integer :notificator_id
      t.string :notificator_type
      t.integer :user_id
      t.string :kind
      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
