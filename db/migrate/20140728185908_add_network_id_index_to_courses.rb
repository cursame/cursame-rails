class AddNetworkIdIndexToCourses < ActiveRecord::Migration
  def change
  	add_index :courses, :network_id
  end
end
