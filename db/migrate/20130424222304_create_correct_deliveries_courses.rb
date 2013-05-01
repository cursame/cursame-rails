class CreateCorrectDeliveriesCourses < ActiveRecord::Migration
  def up
    
    if (ActiveRecord::Base.connection.table_exists?("deliveries_courses")) then
      drop_table :deliveries_courses
    end
    create_table :deliveries_courses, :id => false do |t|
      t.integer :course_id
      t.integer :delivery_id

      t.timestamps
    end
    

  end

  def down



    table = nil
    if (ActiveRecord::Base.connection.table_exists?("deliveries_courses")) then
      table = DeliveriesCourse.all
      drop_table :deliveries_courses
    end
    create_table :deliveries_courses do |t|
      t.integer :course_id
      t.integer :delivery_id
    end

    if !table.nil? then
      table.each do |deliveries_course|
        DeliveriesCourse.create!(:course_id => deliveries_course.course_id, :delivery_id => deliveries_courses.delivery_id)
      end
    end


  end
end
