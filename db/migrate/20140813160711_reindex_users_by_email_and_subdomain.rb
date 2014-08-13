class ReindexUsersByEmailAndSubdomain < ActiveRecord::Migration
	def change
		remove_index :users, :email
		add_index :users, [:email, :subdomain], :unique => true
	end
end
