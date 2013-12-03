class CreateAdminMessages < ActiveRecord::Migration
  def change
    create_table :admin_messages do |t|
      t.string :title
      t.text :text
      t.boolean :status
      t.string :dom_id

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_messages
  end  
end
