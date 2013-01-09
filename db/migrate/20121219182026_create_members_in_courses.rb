class CreateMembersInCourses < ActiveRecord::Migration
  def change
    create_table :members_in_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
