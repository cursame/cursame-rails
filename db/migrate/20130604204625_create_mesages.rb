class CreateMesages < ActiveRecord::Migration
  def change
    create_table :mesages do |t|
      t.text :mesage
      t.integer :user_id
      t.integer :channel_id

      t.timestamps
    end
  end
end
