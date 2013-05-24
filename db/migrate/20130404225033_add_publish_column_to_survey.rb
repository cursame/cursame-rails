class AddPublishColumnToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :publish, :boolean
  end
  def down
    remove_column :surveys, :publish
  end
end
