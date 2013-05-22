class AddAcceptedTermsToUser < ActiveRecord::Migration
  def change
    add_column :users, :accepted_terms, :boolean, :default => false
  end
  
end
