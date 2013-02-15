class AddTwitterLinkToUser < ActiveRecord::Migration
  def change
    add_column :users, :twitter_link, :string

  end
end
