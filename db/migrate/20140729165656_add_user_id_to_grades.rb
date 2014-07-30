class AddUserIdToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :user_id, :integer
    add_index  :grades, :user_id
    Grade.all.each do |grade|
      grade.update_attribute :user_id, grade.gradable.user_id
    end
  end
end
