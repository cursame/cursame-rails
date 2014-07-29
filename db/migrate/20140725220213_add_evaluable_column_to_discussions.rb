class AddEvaluableColumnToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :evaluable, :boolean, default: false
  end
end
