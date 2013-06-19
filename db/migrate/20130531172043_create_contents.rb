class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :contentye_type
      t.integer :contentye_id
      t.text :content

      t.timestamps
    end
  end
end
