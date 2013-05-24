class AddActiveColumnToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :active, :boolean
  end
  def down
    remove_column :surveys, :active
  end
end
