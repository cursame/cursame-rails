class CreateDiscussionResponses < ActiveRecord::Migration
  def change
    create_table :discussion_responses do |t|
      t.integer :discussion_id
      t.integer :user_id
      t.timestamps
    end
    add_index :discussion_responses, :discussion_id
    add_index :discussion_responses, :user_id
  end
end
