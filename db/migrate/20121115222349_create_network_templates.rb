class CreateNetworkTemplates < ActiveRecord::Migration
  def change
    create_table :network_templates do |t|
      t.integer :network_id
      t.text :description

      t.timestamps
    end
  end
end
