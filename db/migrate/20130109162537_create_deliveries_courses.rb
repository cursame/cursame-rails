class CreateDeliveriesCourses < ActiveRecord::Migration
  def change
    create_table :deliveries_courses do |t|
      t.integer :course_id
      t.integer :delivery_id

      t.timestamps
    end
  end
end
