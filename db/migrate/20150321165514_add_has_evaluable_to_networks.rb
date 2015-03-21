class AddHasEvaluableToNetworks < ActiveRecord::Migration
  def change
    add_column :networks, :has_evaluable, :boolean, default: true
  end
end
