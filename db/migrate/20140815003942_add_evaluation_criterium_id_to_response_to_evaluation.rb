class AddEvaluationCriteriumIdToResponseToEvaluation < ActiveRecord::Migration
  def change

    add_column :response_to_the_evaluations, :evaluation_criterium_id, :integer
    add_index :response_to_the_evaluations, :evaluation_criterium_id

    ResponseToTheEvaluation.all.each do |response|
      assignment = Assignment.find_by_id response.feedbackable_id
      evaluation_criteria = EvaluationCriterium.find_all_by_evaluable_id_and_evaluable_type assignment.delivery_id, 'Delivery'
      evaluation_criteria.each do |elem|
        if response.name == elem.name
          response.update_attributes :evaluation_criterium_id => elem.id
        end
      end
    end
  end
end
