class CreateWufooResponses < ActiveRecord::Migration
  def change
    create_table :wufoo_responses do |t|
      t.references :user
      t.references :wufoo_form

      t.timestamps
    end
    add_index :wufoo_responses, :user_id
    add_index :wufoo_responses, :wufoo_form_id
  end
end
