class RemoveActiveColumnFromSurvey < ActiveRecord::Migration
  def up
    remove_column :surveys, :active
  end

  def down
    add_column :surveys, :active, :boolean
  end
end
