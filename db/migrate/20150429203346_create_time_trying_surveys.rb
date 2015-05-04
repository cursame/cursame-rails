class CreateTimeTryingSurveys < ActiveRecord::Migration
  def change
    create_table :time_trying_surveys do |t|
      t.integer :user_id
      t.integer :survey_id
      t.datetime :open_at
      t.datetime :send_at

      t.timestamps
    end
  end
end
