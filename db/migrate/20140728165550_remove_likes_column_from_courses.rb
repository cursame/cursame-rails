class RemoveLikesColumnFromCourses < ActiveRecord::Migration
  def up
  	remove_column :courses, :likes
  end

  def down
  	add_column :courses, :likes, :integer
  end
end
