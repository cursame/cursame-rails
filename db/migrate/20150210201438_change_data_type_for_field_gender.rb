class ChangeDataTypeForFieldGender < ActiveRecord::Migration
  def self.up
  	change_table :user do |t|
  		t.change :gender, :integer
  	end
  end

  def self.down
  	change_table :user do |t|
  		t.change :gender, :string
  	end
  end
end
