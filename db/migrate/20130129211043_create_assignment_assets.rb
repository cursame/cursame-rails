class CreateAssignmentAssets < ActiveRecord::Migration
  def change
    create_table :assignment_assets do |t|
      t.integer :asset_id
      t.integer :assignment_id

      t.timestamps
    end
  end
end
