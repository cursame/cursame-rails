class RemoveUserAndCourseFromWalls < ActiveRecord::Migration
  def up
  	remove_column :walls, :user_id
  	remove_column :walls, :course_id
  end

  def down
  	add_column :walls, :user_id
  	add_column :walls, :course_id
  end
end
