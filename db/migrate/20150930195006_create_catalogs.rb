class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :csv_file, limit: 500, required: true
      t.string :status, limit: 10, required: true, default: 'pending'
      t.string :domain, required: true

      t.timestamps
    end
  end
end
