class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :title
      t.text :description
      t.datetime :publish_date
      t.datetime :end_date
      t.integer :porcent_of_evaluation
      t.integer :course_id

      t.timestamps
    end
  end
end
