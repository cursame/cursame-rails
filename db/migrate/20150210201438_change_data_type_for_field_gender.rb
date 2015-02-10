class ChangeDataTypeForFieldGender < ActiveRecord::Migration
	#According to ISO/IEC 5218, the four codes to model the sexes are:
	# 0 = not known,
	# 1 = male,
	# 2 = female,
	# 9 = not applicable.
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
