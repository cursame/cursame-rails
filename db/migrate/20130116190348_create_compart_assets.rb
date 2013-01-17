class CreateCompartAssets < ActiveRecord::Migration
  def change
    create_table :compart_assets do |t|
      t.string :asset
      t.integer :asset_id
      t.integer :delivery_id
      t.integer :assignment_id
      t.integer :comment_id
      t.integer :question_id

      t.timestamps
    end
  end
end
