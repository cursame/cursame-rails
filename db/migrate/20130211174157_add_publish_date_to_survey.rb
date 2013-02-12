class AddPublishDateToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :publish_date, :datetime

    add_column :surveys, :end_date, :datetime

    add_column :surveys, :network_id, :integer

    add_column :surveys, :user_id, :intege

  end
end
