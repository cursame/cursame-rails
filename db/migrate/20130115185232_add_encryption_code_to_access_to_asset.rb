class AddEncryptionCodeToAccessToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :encryption_code_to_access, :string

  end
end
