class AddPositionToAdminMessages < ActiveRecord::Migration
  def change
    add_column :admin_messages, :position, :string
  end
  def self.down
    remove_column :admin_messages, :position
  end
end
