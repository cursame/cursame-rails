class CreateGoogleForms < ActiveRecord::Migration
  def change
    create_table :google_forms do |t|
      t.string   :title
      t.string   :description
      t.string   :url
      t.integer  :pollable_id
      t.string   :pollable_type
      t.integer  :user_id
      t.datetime :init_date
      t.datetime :term_date

      t.timestamps
    end
    add_index :google_forms, [ :pollable_id, :pollable_type ]
    add_index :google_forms, :user_id
  end
end
