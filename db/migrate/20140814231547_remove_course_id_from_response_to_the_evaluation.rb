class RemoveCourseIdFromResponseToTheEvaluation < ActiveRecord::Migration
  def up
    remove_column :response_to_the_evaluations, :course_id
  end

  def down
    add_column :response_to_the_evaluations, :course_id, :integer
  end
end
