class EditingColumsInResponseToTheEvaluations < ActiveRecord::Migration
  def up
    remove_column :response_to_the_evaluations ,:rub_calification
    add_column :response_to_the_evaluations ,:rub_calification, :float
  end

  def down
  end
end
