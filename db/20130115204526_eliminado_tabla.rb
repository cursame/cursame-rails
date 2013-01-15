class EliminadoTabla < ActiveRecord::Migration
  def up
      drop_table :deliveries_courses
  end

  def down
  end
end
