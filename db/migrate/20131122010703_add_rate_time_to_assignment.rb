class AddRateTimeToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :rate_time, :datetime

  end
end
