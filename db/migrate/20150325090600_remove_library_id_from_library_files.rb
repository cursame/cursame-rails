class RemoveLibraryIdFromLibraryFiles < ActiveRecord::Migration
  def change
    LibraryFile.all.each do |file|
      file.location_id   = file.library_id
      file.location_type = 'Library'
      file.save
    end
    remove_column :library_files, :library_id
  end
end
