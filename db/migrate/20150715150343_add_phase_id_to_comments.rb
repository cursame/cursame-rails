class AddPhaseIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :phase_id, :integer
  end
end
