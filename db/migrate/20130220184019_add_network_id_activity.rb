class AddNetworkIdActivity < ActiveRecord::Migration
  def up
    add_column :activities, :network_id, :integer
  end

  def down
  end
end
