class AddPhaseIdToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :phase_id, :integer
  end
end
