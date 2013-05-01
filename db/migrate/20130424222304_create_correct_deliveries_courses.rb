class CreateCorrectDeliveriesCourses < ActiveRecord::Migration
  def up
    table = nil
    if (ActiveRecord::Base.connection.table_exists?("deliveries_courses")) then
      table = DeliveriesCourse.all
      table = table.map {|x| x.attributes}
      drop_table :deliveries_courses
    end
    create_table :deliveries_courses do |t|
      t.integer :course_id
      t.integer :delivery_id
      t.timestamps
    end

    if !table.nil? then
      table.each do |hash|
        d = DeliveriesCourse.new(hash)
        d.save!
      end
    end
  end

  def down
    if (ActiveRecord::Base.connection.table_exists?("deliveries_courses")) then
      drop_table :deliveries_courses
    end
    create_table :deliveries_courses, :id => false do |t|
      t.integer :course_id
      t.integer :delivery_id

      t.timestamps
    end
  end
end
