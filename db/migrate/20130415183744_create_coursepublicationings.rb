class CreateCoursepublicationings < ActiveRecord::Migration
  def change
    create_table :coursepublicationings do |t|
      t.integer :course_id
      t.integer :wall_id

      t.timestamps
    end
  end
end
