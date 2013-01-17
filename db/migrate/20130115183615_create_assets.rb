class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.string :description
      t.string :file
      t.integer :user_id

      t.timestamps
    end
  end
end
