class RemoveFigureFromResponseToTheEvaluation < ActiveRecord::Migration
  def up
    remove_column :response_to_the_evaluations, :figure
  end

  def down
    add_column :response_to_the_evaluations, :figure, :integer
  end
end
