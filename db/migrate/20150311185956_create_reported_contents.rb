class CreateReportedContents < ActiveRecord::Migration
  def change
    create_table :reported_contents do |t|
      t.references :user
      t.references :network
      t.references :reportable, polymorphic: true
      t.text :description,      null: false
      t.timestamps
    end

    add_index :reported_contents, :user_id
    add_index :reported_contents, :network_id
    add_index :reported_contents, [:reportable_id, :reportable_type]
  end
end
