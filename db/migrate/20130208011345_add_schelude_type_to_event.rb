class AddScheludeTypeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :schedule_type, :string
    add_index :events, [:schedule_id, :schedule_type]
    
  end
end
