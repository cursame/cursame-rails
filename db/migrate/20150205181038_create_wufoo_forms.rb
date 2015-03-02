class CreateWufooForms < ActiveRecord::Migration
  def change
    create_table :wufoo_forms do |t|
      t.string :identifier
      t.references :showable, polymorphic: true
      t.references :user
      t.datetime :init_date
      t.datetime :term_date

      t.timestamps
    end
    add_index :wufoo_forms, :user_id
    add_index :wufoo_forms, [ :showable_id, :showable_type ]
  end
end
