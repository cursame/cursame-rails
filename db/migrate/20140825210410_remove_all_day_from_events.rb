class RemoveAllDayFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :all_day
    remove_column :events, :etag
    remove_column :events, :course_id
  end

  def down
    add_column :events, :all_day,   :boolean
    add_column :events, :etag,      :string
    add_column :events, :course_id, :integer
  end
end
