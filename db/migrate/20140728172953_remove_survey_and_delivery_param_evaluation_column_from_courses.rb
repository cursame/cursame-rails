class RemoveSurveyAndDeliveryParamEvaluationColumnFromCourses < ActiveRecord::Migration
  def up
  	remove_column :courses, :survey_param_evaluation
  	remove_column :courses, :delivery_param_evaluation
  end

  def down
  	add_column :courses, :survey_param_evaluation, :integer
  	add_column :courses, :delivery_param_evaluation, :integer
  end
end
