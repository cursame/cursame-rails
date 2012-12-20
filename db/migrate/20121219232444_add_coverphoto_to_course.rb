class AddCoverphotoToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :coverphoto, :string

  end
end
