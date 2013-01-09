class AddDeliveryIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :delivery_id, :integer

  end
end
