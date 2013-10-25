class AddRegisterFormToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :register_form, :boolean

  end
end
