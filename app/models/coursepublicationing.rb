class Coursepublicationing < ActiveRecord::Base
	belongs_to :course
	belongs_to :wall
end
