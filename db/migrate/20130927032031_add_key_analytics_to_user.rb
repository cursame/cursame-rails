class AddKeyAnalyticsToUser < ActiveRecord::Migration
  def change
    add_column :users, :key_analytics, :string

  end
end
