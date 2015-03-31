class AddNameToLibraryFiles < ActiveRecord::Migration
  def change
    add_column :library_files, :name, :string
  end
end
