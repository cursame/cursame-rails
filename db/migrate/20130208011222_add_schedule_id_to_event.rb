class AddScheduleIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :schedule_id, :integer

  end
end
