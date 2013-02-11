class AddCourseIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :course_id, :integer

  end
end
