class CreateCourseFiles < ActiveRecord::Migration
  def change
    create_table :course_files do |t|
      t.string :file
      t.boolean :published

      t.timestamps
    end
  end
end
