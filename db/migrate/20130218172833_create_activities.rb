class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :activity_type
      t.integer :activable
      t.tring :place

      t.timestamps
    end
  end
end
