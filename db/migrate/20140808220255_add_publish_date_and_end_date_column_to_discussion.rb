class AddPublishDateAndEndDateColumnToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :publish_date, :datetime
    add_column :discussions, :end_date, :datetime

    Discussion.where(publish_date: nil).each do |discussion|
  		discussion.update_attribute :publish_date, discussion.created_at
  	end

  	Discussion.where(end_date: nil).each do |discussion|
  		discussion.update_attribute :end_date, DateTime.now
  	end

  end
end
