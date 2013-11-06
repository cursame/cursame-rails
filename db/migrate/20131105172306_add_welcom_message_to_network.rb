class AddWelcomMessageToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :welcom_message, :text

  end
end
