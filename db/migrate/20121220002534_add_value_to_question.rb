class AddValueToQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :value, :integer
  end
end
