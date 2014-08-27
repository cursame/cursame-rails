class DeleteNetworkTemplates < ActiveRecord::Migration
  def change
    drop_table :network_templates
  end
end
