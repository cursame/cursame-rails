class AddLocationIdAndLocationTypeToFiles < ActiveRecord::Migration
  def change
    add_column :library_files, :location_id, :integer
    add_column :library_files, :location_type, :string
    add_index  :library_files, [ :location_id, :location_type ]
  end
end
