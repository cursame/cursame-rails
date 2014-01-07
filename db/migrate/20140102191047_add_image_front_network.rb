class AddImageFrontNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :image_front, :string, :default => 'background-restore.jpg'
  end

end
