class AddBiosToUser < ActiveRecord::Migration
  def change
    add_column :users, :bios, :text

  end
end
