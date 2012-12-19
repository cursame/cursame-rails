class AddOwnerToMembersInCourse < ActiveRecord::Migration
  def change
    add_column :members_in_courses, :owner, :boolean

  end
end
