class CreateLibraryFiles < ActiveRecord::Migration
  def change
    create_table :library_files do |t|
      t.references :library
      t.string :file

      t.timestamps
    end
    add_index :library_files, :library_id
  end
end
