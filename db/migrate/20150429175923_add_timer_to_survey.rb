class AddTimerToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :timer, :integer, default: 0
  end
end
