class AddFacebookLinkToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook_link, :string

  end
end
