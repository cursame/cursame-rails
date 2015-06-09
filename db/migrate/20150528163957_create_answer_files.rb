class CreateAnswerFiles < ActiveRecord::Migration
  def change
    create_table :answer_files do |t|
      t.integer :answer_id
      t.string :file

      t.timestamps
    end
  end
end
