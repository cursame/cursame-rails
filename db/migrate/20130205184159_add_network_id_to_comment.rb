class AddNetworkIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :netwok_id, :integer

  end
end
