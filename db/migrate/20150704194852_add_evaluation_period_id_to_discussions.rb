class AddEvaluationPeriodIdToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :evaluation_period_id, :integer
  end
end
