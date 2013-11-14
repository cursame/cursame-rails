class AddRegisterFormToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :register_form, :boolean, :default => false

  end
end
