class AddOnlineToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :online, :string

  end
end
