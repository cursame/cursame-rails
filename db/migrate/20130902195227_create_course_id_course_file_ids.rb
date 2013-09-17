class CreateCourseIdCourseFileIds < ActiveRecord::Migration
  def change
    create_table :course_id_course_file_ids do |t|
      t.integer :course_id
      t.integer :course_file_id

      t.timestamps
    end
  end
end
