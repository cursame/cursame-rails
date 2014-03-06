class AddFormBeforeTourToUser < ActiveRecord::Migration
  def change
    add_column :users, :form_before_tour, :boolean, :default => false

  end
end
