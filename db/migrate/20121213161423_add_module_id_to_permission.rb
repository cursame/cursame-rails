class AddModuleIdToPermission < ActiveRecord::Migration
  def change
    add_column :permissions, :module_id, :integer

  end
end
