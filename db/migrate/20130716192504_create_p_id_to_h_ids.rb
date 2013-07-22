class CreatePIdToHIds < ActiveRecord::Migration
  def change
    create_table :p_id_to_h_ids do |t|
      t.integer :p_id
      t.integer :h_id

      t.timestamps
    end
  end
end
