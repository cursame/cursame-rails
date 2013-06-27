class AddContentHtmlToContent < ActiveRecord::Migration
  def change
    add_column :contents, :content_html, :text

  end
end
