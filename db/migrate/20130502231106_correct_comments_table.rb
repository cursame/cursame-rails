class CorrectCommentsTable < ActiveRecord::Migration
  def up
    remove_column :comments, :netwok_id
  end

  def down
    add_column :comments, :netwok_id, :integer
  end
end
