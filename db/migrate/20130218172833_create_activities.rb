class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :activitye_type
      t.integer :activitye
      t.string :place
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
