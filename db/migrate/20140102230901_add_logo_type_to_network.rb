class AddLogoTypeToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :logo_type, :string

  end
end
