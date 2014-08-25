class RemoveFinishDateFromCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :finish_date
  end

  def down
    add_column :courses, :finish_date, :datetime
  end
end
