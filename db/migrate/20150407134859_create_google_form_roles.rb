class CreateGoogleFormRoles < ActiveRecord::Migration
  def change
    create_table :google_form_roles do |t|
      t.references :google_form
      t.references :role

      t.timestamps
    end
    add_index :google_form_roles, :role_id
    add_index :google_form_roles, :google_form_id
  end
end
