class AddPublicRegisterToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :public_register, :boolean, :default => true
    add_column :networks, :free, :boolean, :default => true
  end
end
