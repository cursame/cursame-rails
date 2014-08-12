class RenameDiscussionsCoursesToDiscussionCourse < ActiveRecord::Migration
  def up
  	rename_table :discussions_courses, :discussion_courses
  end

  def down
  	rename_table :discussion_courses, :discussions_courses
  end
end
