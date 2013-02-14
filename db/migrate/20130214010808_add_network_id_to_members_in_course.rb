class AddNetworkIdToMembersInCourse < ActiveRecord::Migration
  def change
    add_column :members_in_courses, :network_id, :integer

  end
end
