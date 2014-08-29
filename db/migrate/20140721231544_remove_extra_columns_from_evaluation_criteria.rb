class RemoveExtraColumnsFromEvaluationCriteria < ActiveRecord::Migration
  def change
    remove_column :evaluation_criteria, :description
    remove_column :evaluation_criteria, :assignment_id
    remove_column :evaluation_criteria, :date_of_item
    remove_column :evaluation_criteria, :active
    remove_column :evaluation_criteria, :delivery_id
  end
end
