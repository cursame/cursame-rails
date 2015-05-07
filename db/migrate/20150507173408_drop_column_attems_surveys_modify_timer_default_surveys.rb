class DropColumnAttemsSurveysModifyTimerDefaultSurveys < ActiveRecord::Migration
  def up
  	remove_column :surveys, :attempts
  	change_column :surveys, :timer, :integer, default: 0
  end

  def down
  	add_column :surveys, :attempts, :integer, default: 1
  end
end
