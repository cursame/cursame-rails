class AddEvaluationCriteriumIdToResponseToEvaluation < ActiveRecord::Migration
  def change
  	ResponseToTheEvaluation.all.each do |response|
  	  criterium = EvaluationCriterium.find_by_evaluable_id_and_evaluable_type response.feedbackable_id, 'Assignment'
  	  if criterium.nil?
  	  	EvaluationCriterium.create name: response.name, evaluable_id: response.feedbackable_id, evaluable_type: 'Assignment'
  	  end
  	end
  	remove_column :response_to_the_evaluations, :name
  end
end
