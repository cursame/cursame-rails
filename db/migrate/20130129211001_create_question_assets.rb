class CreateQuestionAssets < ActiveRecord::Migration
  def change
    create_table :question_assets do |t|
      t.integer :asset_id
      t.integer :question_id

      t.timestamps
    end
  end
end
