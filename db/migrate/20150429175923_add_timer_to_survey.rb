class AddTimerToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :timer, :integer, default: 60
    add_column :surveys, :attempts, :integer, default: 1
  end
end
