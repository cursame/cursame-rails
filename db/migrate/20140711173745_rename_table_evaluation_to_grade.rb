class RenameTableEvaluationToGrade < ActiveRecord::Migration
  def self.up
    rename_table :evaluations, :grades
  end
  
 def self.down
    rename_table :grades, :evaluations
 end
end
