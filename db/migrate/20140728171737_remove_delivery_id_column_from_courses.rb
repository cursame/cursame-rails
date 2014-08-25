class RemoveDeliveryIdColumnFromCourses < ActiveRecord::Migration
  def up
  	remove_column :courses, :delivery_id
  end

  def down
  	add_column :courses, :delivery_id, :integer
  end
end
