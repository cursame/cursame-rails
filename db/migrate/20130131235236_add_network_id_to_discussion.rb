class AddNetworkIdToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :network_id, :integer

  end
end
