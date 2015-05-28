class CreateQuestionFiles < ActiveRecord::Migration
  def change
    create_table :question_files do |t|
      t.integer :question_id
      t.string :file

      t.timestamps
    end
  end
end
