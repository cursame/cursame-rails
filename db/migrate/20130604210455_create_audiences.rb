class CreateAudiences < ActiveRecord::Migration
  def change
    create_table :audiences do |t|
      t.integer :user_id
      t.integer :channel_id

      t.timestamps
    end
  end
end
