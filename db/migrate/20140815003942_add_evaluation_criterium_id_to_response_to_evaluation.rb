class AddEvaluationCriteriumIdToResponseToEvaluation < ActiveRecord::Migration
  def change

  	add_column :response_to_the_evaluations, :evaluation_criterium, :integer
    remove_column :response_to_the_evaluations, :evaluation_porcentage
    add_index :response_to_the_evaluations, :evaluation_criterium

  	ResponseToTheEvaluation.all.each do |response|
  	  assignment = Assignment.find_by_id response.feedbackable_id
  	  evaluation_criteria = EvaluationCriterium.find_all_by_evaluable_id_and_evaluable_type assignment.delivery_id, 'Delivery'
  	  evaluation_criteria.each do |elem|
  	  	if response.name == elem.name
  	  		response.update_attributes :evaluation_criteria, elem.id
  	  	end
  	  end
  	end

  	# ResponseToTheEvaluation.all.each do |response|
  	#   criterium = EvaluationCriterium.find_by_evaluable_id_and_evaluable_type response.feedbackable_id, 'Delivery'
  	#   if criterium.nil?
  	#   	EvaluationCriterium.create name: response.name, evaluable_id: response.feedbackable_id, evaluable_type: 'Delivery'
  	#   end
  	#  end

	remove_column :response_to_the_evaluations, :name
  end
end
