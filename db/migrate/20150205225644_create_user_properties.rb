class CreateUserProperties < ActiveRecord::Migration
  def change
    create_table :user_properties do |t|
      t.integer :user_id
      t.string :property
      t.string :value

      t.timestamps
    end
  end
end
