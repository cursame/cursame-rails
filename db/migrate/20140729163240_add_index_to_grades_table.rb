class AddIndexToGradesTable < ActiveRecord::Migration
  def change
  	add_index :grades, [:gradable_id, :gradable_type]
  end
end
