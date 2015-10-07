class CreateCatalogErrors < ActiveRecord::Migration
  def change
    create_table :catalog_errors do |t|
      t.belongs_to :catalog, required: true
      t.integer :row, required: true
      t.string :email, required: true
      t.string :errors_message, limit: 400, required: true
      t.string :field, required: true
      t.timestamps
    end
    add_index(:catalog_errors, :catalog_id)
  end
end
