class AddEvaluationPeriodIdToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :evaluation_period_id, :integer
  end
end
