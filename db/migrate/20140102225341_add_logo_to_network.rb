class AddLogoToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :logo, :string, :default => 'logo.png'

  end
end
