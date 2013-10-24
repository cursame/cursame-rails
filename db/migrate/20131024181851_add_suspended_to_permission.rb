class AddSuspendedToPermission < ActiveRecord::Migration
  def change
    add_column :permissionings, :suspended, :boolean

  end
end
