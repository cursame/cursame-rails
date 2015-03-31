class AddEvaluableToNetworks < ActiveRecord::Migration
  def change
    add_column :networks, :evaluable, :boolean, default: true
  end
end
