class AddPersonalUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :personal_url, :string

  end
end
