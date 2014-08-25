class RemovePorcentOfEvaluationFromDeliveries < ActiveRecord::Migration
  def up
  	remove_column :deliveries, :porcent_of_evaluation
  end

  def down
  	add_column :deliveries, :porcent_of_evaluation, :integer
  end
end
