class AddSurveyAssetsTable < ActiveRecord::Migration
  def up
  	create_table :survey_assets do |t|
      t.integer :asset_id
      t.integer :survey_id
      t.timestamps
    end
    add_index :survey_assets, :asset_id
    add_index :survey_assets, :survey_id
  end

  def down
  	drop_table :survey_assets
  end
end
