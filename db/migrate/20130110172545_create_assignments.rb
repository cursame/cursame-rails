class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :brief_description
      t.integer :delivery_id
      t.integer :accomplishment

      t.timestamps
    end
  end
end
