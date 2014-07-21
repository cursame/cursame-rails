class EditColumnsFromEvaluationCriteria < ActiveRecord::Migration
  def change
  	EvaluationCriteria.all.each do |criteria|
      unless criteria.delivery_id.nil?
        criteria.evaluable_id   = criteria.delivery_id
        criteria.evaluable_type = 'Delivery'
      end
    end
  end
end
