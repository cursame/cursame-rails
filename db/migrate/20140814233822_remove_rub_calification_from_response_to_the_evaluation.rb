class RemoveRubCalificationFromResponseToTheEvaluation < ActiveRecord::Migration
  def up
    remove_column :response_to_the_evaluations, :rub_calification
  end

  def down
    add_column :response_to_the_evaluations, :rub_calification, :integer
  end
end
