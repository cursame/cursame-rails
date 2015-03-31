class AddNameAndDescriptionToLibraries < ActiveRecord::Migration
  def change
    add_column :libraries, :title, :string
    add_column :libraries, :description, :text
  end
end
