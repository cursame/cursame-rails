class AddFinalGradeToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :final_grade, :boolean, null: false, default: true
  end
end
