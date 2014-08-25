class RemoveSettingsTeacher < ActiveRecord::Migration
  def up
  	drop_table :settings_teachers
  end

  def down
  	create_table :settings_teachers do |t|
      t.integer :limit_deliveries
      t.integer :count_deliveries
      t.integer :limit_surveys
      t.integer :count_surveys

      t.timestamps
    end
  end
end
