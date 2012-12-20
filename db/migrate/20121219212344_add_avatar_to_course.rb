class AddAvatarToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :avatar, :string

  end
end
