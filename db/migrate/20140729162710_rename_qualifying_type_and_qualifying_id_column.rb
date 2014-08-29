class RenameQualifyingTypeAndQualifyingIdColumn < ActiveRecord::Migration
  def up
  	rename_column :grades, :qualifying_id,   :gradable_id
  	rename_column :grades, :qualifying_type, :gradable_type
  end

  def down
  	rename_column :grades, :gradable_id,   :qualifying_id
  	rename_column :grades, :gradable_type, :qualifying_type
  end
end
