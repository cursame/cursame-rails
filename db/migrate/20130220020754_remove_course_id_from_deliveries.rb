class RemoveCourseIdFromDeliveries < ActiveRecord::Migration
  def up
  	remove_column :deliveries, :course_id
  end

  def down
  end
end
