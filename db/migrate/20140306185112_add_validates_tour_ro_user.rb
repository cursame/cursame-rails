class AddValidatesTourRoUser < ActiveRecord::Migration
  def change
  	    add_column :users, :tour_network, :boolean, :default => false
  	    add_column :users, :tour_profile, :boolean, :default => false
  	    add_column :users, :tour_course, :boolean, :default => false
  end
end
