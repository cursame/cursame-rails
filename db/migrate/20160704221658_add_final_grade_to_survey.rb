class AddFinalGradeToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :final_grade, :boolean, null: false, default: true
  end
end
