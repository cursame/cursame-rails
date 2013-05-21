class AddAutoHtmlToDiscussionsDeliveriesAssigments < ActiveRecord::Migration
  def change
  	 add_column :assignments, :brief_description_html, :text
  	 add_column :discussions, :description_html, :text
  	 add_column :deliveries, :description_html, :text
  end
  def down
  	remove_column :assignments, :brief_description_html
  	remove_column :discussions, :description_html
  	remove_column :deliveries, :description_html
  end
end

