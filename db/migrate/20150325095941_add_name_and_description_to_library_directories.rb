class AddNameAndDescriptionToLibraryDirectories < ActiveRecord::Migration
  def change
    add_column :library_directories, :name, :string
    add_column :library_directories, :description, :text
  end
end
