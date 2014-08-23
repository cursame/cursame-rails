class Grade < ActiveRecord::Base
	attr_accessible :user_id, :score, :gradable, :user
	belongs_to :gradable, polymorphic: true
	belongs_to :user

	validates_associated :user
	validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

end
