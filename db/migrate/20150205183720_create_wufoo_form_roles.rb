class CreateWufooFormRoles < ActiveRecord::Migration
  def change
    create_table :wufoo_form_roles do |t|
      t.references :wufoo_form
      t.references :role

      t.timestamps
    end
    add_index :wufoo_form_roles, :wufoo_form_id
    add_index :wufoo_form_roles, :role_id
  end
end
