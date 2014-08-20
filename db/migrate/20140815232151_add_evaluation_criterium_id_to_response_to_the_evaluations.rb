class AddEvaluationCriteriumIdToResponseToTheEvaluations < ActiveRecord::Migration
  def change
    add_column :response_to_the_evaluations, :evaluation_criterium_id, :integer
    remove_column :response_to_the_evaluations, :evaluation_porcentage
    add_index :response_to_the_evaluations, :evaluation_criterium_id
  end
end
