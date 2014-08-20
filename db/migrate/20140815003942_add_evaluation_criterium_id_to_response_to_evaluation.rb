class AddEvaluationCriteriumIdToResponseToEvaluation < ActiveRecord::Migration
  def change

    add_column :response_to_the_evaluations, :evaluation_criterium_id, :integer
    add_index :response_to_the_evaluations, :evaluation_criterium_id

    ResponseToTheEvaluation.all.each do |response|
      puts "Response id: #{response.id} name: #{response.name}"
      assignment = Assignment.find_by_id response.feedbackable_id
      puts "Assignment id: #{assignment.id} delivery: #{assignment.delivery_id}"
      evaluation_criteria = EvaluationCriterium.find_all_by_evaluable_id_and_evaluable_type assignment.delivery_id, "Delivery"
      evaluation_criteria.each do |elem|
        puts "Evaluation criteria id: #{evaluation_criteria.id} names: #{response.name} #{elem.name}"
        if response.name == elem.name
          puts "DATA UPDATED"
          response.update_attributes :evaluation_criterium_id => elem.id
        else
          puts "Not found"
        end
      end
    end
  end
end
