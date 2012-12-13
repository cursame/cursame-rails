class CreateModuls < ActiveRecord::Migration
  def change
    create_table :moduls do |t|
      t.string :name
      t.integer :role_id

      t.timestamps
    end
  end
end
