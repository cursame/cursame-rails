class RemoveUnusedColumnsFromAssets < ActiveRecord::Migration
  def up
    remove_column :assets, :title
    remove_column :assets, :description
    remove_column :assets, :encryption_code_to_access
  end

  def down
    add_column :assets, :encryption_code_to_access, :string
    add_column :assets, :description, :string
    add_column :assets, :title, :string
  end
end
