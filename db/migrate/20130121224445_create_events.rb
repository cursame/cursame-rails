class CreateEvents < ActiveRecord::Migration
   def change
      create_table :events do |t|
        t.string :title
        t.datetime :starts_at
        t.datetime :ends_at
        t.boolean :all_day
        t.text :description
        t.integer :user_id
        t.integer :network_id

        t.timestamps
      end
    end
end
