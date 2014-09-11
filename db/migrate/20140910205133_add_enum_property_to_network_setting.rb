class AddEnumPropertyToNetworkSetting < ActiveRecord::Migration
  def change
  	remove_column :network_settings, :property, :string
  	add_column :network_settings, :property_field, :string
  end
end
