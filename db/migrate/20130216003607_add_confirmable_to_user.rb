class AddConfirmableToUser < ActiveRecord::Migration
  def change
    
    ## Confirmable
    
    add_column :users, :confirmation_token, :string

    add_column :users, :confirmed_at, :datetime

    add_column :users, :confirmation_sent_at, :datetime

    add_column :users, :unconfirmed_email, :string
    
    ## Lockable
    
    add_column :users, :failed_attempts, :integer, :default => 0 
    
    add_column :users, :unlock_token, :string
    
    add_column :users, :locked_at, :datetime
    
    
    ## Token authenticatable
    
    add_column :users, :authentication_token, :string

  end
end
