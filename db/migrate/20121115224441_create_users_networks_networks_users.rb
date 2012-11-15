class CreateUsersNetworksNetworksUsers < ActiveRecord::Migration
  def change
    create_table :users_networks_networks_users do |t|
      t.integer :user_id
      t.integer :network_id

      t.timestamps
    end
  end
end
