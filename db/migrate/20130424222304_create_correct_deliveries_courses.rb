class CreateCorrectDeliveriesCourses < ActiveRecord::Migration
  def up
    if (ActiveRecord::Base.connection.table_exists?("deliveries_courses")) then
      drop_table :deliveries_courses
    end

    create_table :deliveries_courses do |t|
      t.integer :course_id
      t.integer :delivery_id
    end
  end

  def down
    if (ActiveRecord::Base.connection.table_exists?("deliveries_courses")) then
      drop_table :deliveries_courses
    end
  end
end
