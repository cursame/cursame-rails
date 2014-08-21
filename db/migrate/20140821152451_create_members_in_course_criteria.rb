class CreateMembersInCourseCriteria < ActiveRecord::Migration
  def change
    create_table :members_in_course_criteria do |t|
      t.integer :members_in_course_id
      t.integer :evaluation_criterium_id

      t.timestamps
    end
    add_index :members_in_course_criteria, :members_in_course_id
    add_index :members_in_course_criteria, :evaluation_criterium_id
  end
end
