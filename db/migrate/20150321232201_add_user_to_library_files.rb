class AddUserToLibraryFiles < ActiveRecord::Migration
  def change
    add_column :library_files, :user_id, :integer
    add_index  :library_files, :user_id
  end
end
