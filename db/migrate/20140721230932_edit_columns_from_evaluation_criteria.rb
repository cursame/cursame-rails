class EditColumnsFromEvaluationCriteria < ActiveRecord::Migration
  def change
  	EvaluationCriterium.all.each do |criteria|
      unless criteria.delivery_id.nil?
        criteria.evaluable_id   = criteria.delivery_id
        criteria.evaluable_type = 'Delivery'
        criteria.save
      end
    end
  end
end
