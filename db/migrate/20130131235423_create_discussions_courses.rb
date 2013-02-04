class CreateDiscussionsCourses < ActiveRecord::Migration
  def change
    create_table :discussions_courses do |t|
      t.integer :discussion_id
      t.integer :course_id

      t.timestamps
    end
  end
end
