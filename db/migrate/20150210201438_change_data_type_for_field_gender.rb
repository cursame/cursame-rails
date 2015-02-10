class ChangeDataTypeForFieldGender < ActiveRecord::Migration
  def self.up
  	change_table :users do |t|
  		t.change :gender, :integer, null: false, default: 0
  	end
  end

  def self.down
  	change_table :users do |t|
  		t.change :gender, :string
  	end
  end
end
