class AddSurveyParamEvaluationAndDeliveryParamEvaluationToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :survey_param_evaluation, :integer

    add_column :courses, :delivery_param_evaluation, :integer

  end
end
