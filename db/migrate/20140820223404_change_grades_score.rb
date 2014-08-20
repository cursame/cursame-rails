class ChangeGradesScore < ActiveRecord::Migration
	def up
		change_column :grades, :score, :float
		Grade.all.each do |grade|
			grade.score /= 10
			grade.save
		end
	end

	def down
		change_column :grades, :score, :integer
		Grade.all.each do |grade|
			grade.score *= 10
			grade.save
		end
	end
end
