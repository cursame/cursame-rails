class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :activitye_type
      t.integer :activitye_id
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :ip_address
      t.string :browser
      t.string :version_browser
      t.string :computer_plataform
      t.integer :user_id

      t.timestamps
    end
  end
end
