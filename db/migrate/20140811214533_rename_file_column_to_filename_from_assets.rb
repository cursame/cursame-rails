class RenameFileColumnToFilenameFromAssets < ActiveRecord::Migration
  def up
  	rename_column :assets, :file, :filename
  end

  def down
  	rename_column :assets, :filename, :file
  end
end
