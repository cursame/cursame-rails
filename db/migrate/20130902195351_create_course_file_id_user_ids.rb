class CreateCourseFileIdUserIds < ActiveRecord::Migration
  def change
    create_table :course_file_id_user_ids do |t|
      t.integer :course_file_id
      t.integer :user_id

      t.timestamps
    end
  end
end
