class AddEvaluationPeriodIdToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :evaluation_period_id, :integer
  end
end
