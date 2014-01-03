class AddImageFrontNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :image_front, :string
  end

end
