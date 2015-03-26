class AddUserIdToLibraryDirectories < ActiveRecord::Migration
  def change
    add_column :library_directories, :user_id, :integer
    add_index :library_directories, :user_id
  end
end
