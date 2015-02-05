class CreateWufooFormRules < ActiveRecord::Migration
  def change
    create_table :wufoo_form_rules do |t|
      t.references :wufoo_form
      t.references :role

      t.timestamps
    end
    add_index :wufoo_form_rules, :wufoo_form_id
    add_index :wufoo_form_rules, :role_id
  end
end
