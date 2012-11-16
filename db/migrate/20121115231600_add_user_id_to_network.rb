class AddUserIdToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :user_id, :integer

  end
end
