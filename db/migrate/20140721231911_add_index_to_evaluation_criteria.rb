class AddIndexToEvaluationCriteria < ActiveRecord::Migration
  def change
  	add_index :evaluation_criteria, [:evaluable_id, :evaluable_type]
  end
end
