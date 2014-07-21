class AddEvaluableIdAndEvaluableTypeToEvaluationCriteria < ActiveRecord::Migration
  def change
    add_column :evaluation_criteria, :evaluable_id, :integer
    add_column :evaluation_criteria, :evaluable_type, :string
  end
end
