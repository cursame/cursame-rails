class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :id
      t.string :title
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
