class CreateUserpublicationings < ActiveRecord::Migration
  def change
    create_table :userpublicationings do |t|
      t.integer :user_id
      t.integer :wall_id

      t.timestamps
    end
  end
end
