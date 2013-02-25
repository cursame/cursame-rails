class AddNetworkIdToWalls < ActiveRecord::Migration
  def change
  	add_column :walls, :network_id, :integer
  end
end
