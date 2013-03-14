class AddActiveStatusToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :active_status, :boolean, :default => true

  end
end
