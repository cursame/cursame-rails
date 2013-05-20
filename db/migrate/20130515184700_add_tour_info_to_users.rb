class AddTourInfoToUsers < ActiveRecord::Migration
   def change
  	add_column :users, :tour_info, :string, :default => "000"
  end
  def down
  	remove_column :users, :string
  end
end
