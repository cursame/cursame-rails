class AddNetworkIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :network_id, :integer

  end
end
