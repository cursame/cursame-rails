class AddUserToWall < ActiveRecord::Migration
  def change
    add_column :walls, :user_id, :integer

  end
end
