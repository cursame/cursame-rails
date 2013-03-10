class AddFigureToResponseToTheEvaluation < ActiveRecord::Migration
  def change
    add_column :response_to_the_evaluations, :figure, :integer

  end
end
