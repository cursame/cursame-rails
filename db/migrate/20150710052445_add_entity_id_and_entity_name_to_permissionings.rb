class AddEntityIdAndEntityNameToPermissionings < ActiveRecord::Migration
  def change
    add_column :permissionings, :entity_id, :integer
    add_column :permissionings, :entity_name, :string
  end
end
