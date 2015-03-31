class AddDescriptionToLibraryFiles < ActiveRecord::Migration
  def change
    add_column :library_files, :description, :string
  end
end
