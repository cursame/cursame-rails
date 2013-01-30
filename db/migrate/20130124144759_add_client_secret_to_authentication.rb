class AddClientSecretToAuthentication < ActiveRecord::Migration
  def change
    add_column :authentications, :client_secret, :string

  end
end
