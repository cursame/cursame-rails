class AddLogoTypeToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :logo_type, :string, :default => '128x26'

  end
end
