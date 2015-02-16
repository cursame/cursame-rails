class CreateWufooForms < ActiveRecord::Migration
  def change
    create_table :wufoo_forms do |t|
      t.integer :form_id
      t.references :showable, polymorphic: true, index: true
      t.datetime :init_date
      t.datetime :term_date

      t.timestamps
    end
    add_index :wufoo_forms, [ :showable_id, :showable_type ]
  end
end
