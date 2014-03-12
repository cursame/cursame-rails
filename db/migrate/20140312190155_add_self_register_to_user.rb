class AddSelfRegisterToUser < ActiveRecord::Migration
  def change
    add_column :users, :self_register, :boolean, :default => false

  end
end
