class AddEtagToEvent < ActiveRecord::Migration
  def change
    add_column :events, :etag, :string

  end
end
