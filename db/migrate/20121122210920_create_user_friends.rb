class CreateUserFriends < ActiveRecord::Migration
  def change
    create_table :user_friends do |t|

      t.timestamps
    end
  end
end
