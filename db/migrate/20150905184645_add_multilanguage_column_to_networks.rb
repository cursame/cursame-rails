class AddMultilanguageColumnToNetworks < ActiveRecord::Migration
  def change
    add_column :networks, :multilanguage, :boolean, default: false
  end
end
