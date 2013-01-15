class AddDeliveryIdToAreasOfEvaluation < ActiveRecord::Migration
  def change
    add_column :areas_of_evaluations, :delivery_id, :integer

  end
end
