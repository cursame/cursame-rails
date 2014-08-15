class RemoveRateTimeFromAssignments < ActiveRecord::Migration
  def up
    remove_column :assignments, :rate_time
  end

  def down
    add_column :assignments, :rate_time, :datetime
  end
end
