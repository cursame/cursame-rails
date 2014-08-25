class ChangeResponseToTheEvaluation < ActiveRecord::Migration
  def up
    rename_column :response_to_the_evaluations, :assignment_id, :feedbackable_id
    add_column    :response_to_the_evaluations, :feedbackable_type, :string
    ResponseToTheEvaluation.all.each do |response|
      response.update_attributes feedbackable_type: 'Assignment'
    end
  end

  def down
    rename_column :response_to_the_evaluations, :feedbackable_id, :assignment_id
    remove_column :response_to_the_evaluations, :feedbackable_type
  end
end
