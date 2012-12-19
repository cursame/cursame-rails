class AddPublicStatusToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :public_status, :string

  end
end
