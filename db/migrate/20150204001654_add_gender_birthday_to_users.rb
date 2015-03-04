class AddGenderBirthdayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :birthday, :date, null: false, default: Date.today
  end
end
