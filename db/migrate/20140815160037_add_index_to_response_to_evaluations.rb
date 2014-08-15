class AddIndexToResponseToEvaluations < ActiveRecord::Migration
  def change
    add_index :response_to_the_evaluations, [:feedbackable_id, :feedbackable_type], name: 'feedbackable_index'
  end
end
