class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :activity_type
      t.integer :activable
      t.string :place
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
