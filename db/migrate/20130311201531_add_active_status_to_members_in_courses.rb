class AddActiveStatusToMembersInCourses < ActiveRecord::Migration
  def change
    add_column :members_in_courses, :active_status, :boolean, :default => true

  end
end
