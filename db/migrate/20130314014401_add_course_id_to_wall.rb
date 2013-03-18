class AddCourseIdToWall < ActiveRecord::Migration
  def change
    add_column :walls, :course_id, :integer

  end
end
