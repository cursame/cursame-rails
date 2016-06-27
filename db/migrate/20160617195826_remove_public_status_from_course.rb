class RemovePublicStatusFromCourse < ActiveRecord::Migration
  def up
    remove_column :courses, :public_status
  end

  def down
    add_column :courses, :public_status, :string
  end
end
