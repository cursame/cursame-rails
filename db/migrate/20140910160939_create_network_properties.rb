class CreateNetworkProperties < ActiveRecord::Migration
  def change
    create_table :network_properties do |t|
      t.string :name

      t.timestamps
    end
  end
end
