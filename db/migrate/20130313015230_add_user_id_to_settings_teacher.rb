class AddUserIdToSettingsTeacher < ActiveRecord::Migration
  def change
    add_column :settings_teachers, :user_id, :integer

  end
end
