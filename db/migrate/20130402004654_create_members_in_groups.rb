class CreateMembersInGroups < ActiveRecord::Migration
  def change
    create_table :members_in_groups do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
