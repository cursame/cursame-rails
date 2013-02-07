class AddNetworkIdToPermissioning < ActiveRecord::Migration
  def change
    add_column :permissionings, :network_id, :integer

  end
end
