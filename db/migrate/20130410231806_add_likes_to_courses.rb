class AddLikesToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :likes, :integer
  end
end
