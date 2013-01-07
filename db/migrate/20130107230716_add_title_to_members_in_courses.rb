class AddTitleToMembersInCourses < ActiveRecord::Migration
  def change
    add_column :members_in_courses, :title, :string, :default => "curso"

  end
end
