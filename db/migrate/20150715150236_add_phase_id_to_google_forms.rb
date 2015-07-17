class AddPhaseIdToGoogleForms < ActiveRecord::Migration
  def change
    add_column :google_forms, :phase_id, :integer
  end
end
