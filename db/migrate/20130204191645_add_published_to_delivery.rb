class AddPublishedToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :published, :boolean
  end
end
