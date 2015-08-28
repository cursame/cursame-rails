class AddLanguageColumnToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :language, :string, :default => I18n.default_locale.to_s
  end
end
