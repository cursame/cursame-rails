class AddCoverphotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :coverphoto, :string

  end
end
