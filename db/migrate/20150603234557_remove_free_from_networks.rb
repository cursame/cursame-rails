class RemoveFreeFromNetworks < ActiveRecord::Migration
  def up
    remove_column :networks, :free
  end

  def down
    add_column :networks, :free, :boolean
  end
end
