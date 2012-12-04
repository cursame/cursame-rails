class CreateRoleIdAndPermissionIds < ActiveRecord::Migration
  def change
    create_table :role_id_and_permission_ids do |t|
      t.integer :role_id
      t.integer :permission_id

      t.timestamps
    end
  end
end
