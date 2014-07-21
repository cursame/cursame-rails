class RenameAreasOfEvaluationToEvaluationCriteria < ActiveRecord::Migration
  def up
    rename_table :areas_of_evaluations, :evaluation_criteria
  end

  def down
    rename_table :evaluation_criteria, :areas_of_evaluations
  end
end
