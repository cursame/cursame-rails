class CreateBasicPermiissions < ActiveRecord::Migration
  def change
    create_table :basic_permiissions do |t|
      t.string :title

      t.timestamps
    end
  end
end
