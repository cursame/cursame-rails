class AddCouseIdToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :course_id, :integer

  end
end
