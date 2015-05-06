class CreateBitSettings < ActiveRecord::Migration
  def change
    create_table :bit_settings do |t|
      t.integer :network_id,            null: false
      t.string :authorization_keyword,  null: false
      t.string :api_key,                null: false

      t.timestamps
    end
    add_index :bit_settings, :network_id
  end
end
