class AddEvaluationCriteriumIdToResponseToTheEvaluations < ActiveRecord::Migration
  def change
    remove_column :response_to_the_evaluations, :evaluation_porcentage
  end
end
