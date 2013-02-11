class CreateEventsCourses < ActiveRecord::Migration
  def change
    create_table :events_courses do |t|
      t.integer :course_id
      t.integer :event_id

      t.timestamps
    end
  end
end
