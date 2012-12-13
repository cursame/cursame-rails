class AddActiveToPermission < ActiveRecord::Migration
  def change
    add_column :permissions, :active, :boolean

  end
end
