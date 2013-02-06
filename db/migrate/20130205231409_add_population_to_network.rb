class AddPopulationToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :population, :integer

  end
end
