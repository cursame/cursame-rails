class CreateLibraryDirectories < ActiveRecord::Migration
  def change
    create_table :library_directories do |t|
      t.integer :location_id
      t.string :location_type

      t.timestamps
    end
    add_index :library_directories, [ :location_id, :location_type ]
  end
end
