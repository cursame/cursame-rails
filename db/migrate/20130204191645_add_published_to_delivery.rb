class AddPublishedToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :state, :string
  end
end
