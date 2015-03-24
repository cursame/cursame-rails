class AddNameAndDescriptionToLibraries < ActiveRecord::Migration
  def change
    add_column :libraries, :name, :string
    add_column :libraries, :description, :string
  end
end
