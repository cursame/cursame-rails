class CreateNetworksUsers < ActiveRecord::Migration
  def change
    create_table :networks_users, :id => false do |t|
      t.integer :network_id
      t.integer :user_id

      t.timestamps
      
    end
  end
end
