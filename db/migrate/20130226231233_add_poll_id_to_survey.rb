class AddPollIdToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :poll_id, :integer

  end
end
