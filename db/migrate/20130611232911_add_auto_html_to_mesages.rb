class AddAutoHtmlToMesages < ActiveRecord::Migration
   def change
  	 add_column :mesages, :mesage_html, :text
  end
  def down
  	remove_column :mesages, :mesage_html
  end
end
