class CreateUsernotificationings < ActiveRecord::Migration
  def change
    create_table :usernotificationings do |t|
      t.integer :user_id
      t.integer :notification_id

      t.timestamps
    end
  end
end
