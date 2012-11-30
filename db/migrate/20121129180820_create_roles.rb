class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.text :description
      t.date :created

      t.timestamps
    end
  end
end
