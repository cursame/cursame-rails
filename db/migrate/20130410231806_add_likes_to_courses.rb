class AddLikesToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :likes, :integer
  end
  def down
    remove_column :courses, :likes
  end
end
