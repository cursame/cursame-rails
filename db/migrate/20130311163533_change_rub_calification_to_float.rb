class ChangeRubCalificationToFloat < ActiveRecord::Migration
  def up
    remove_column :assignments, :rub_calification
    add_column :assignments, :rub_calification, :float
  end

  def down
  end
end
