class AddModulIdToPermission < ActiveRecord::Migration
  def change
    add_column :permissions, :modul_id, :integer

  end
end
