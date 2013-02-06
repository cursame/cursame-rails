class AddNetworkIdToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :network_id, :integer

  end
end
