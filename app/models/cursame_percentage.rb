class CursamePercentage < ActiveRecord::Base
  belongs_to :course
  validates :course, presence: true

  validates :deliveries, :discussions, :surveys, :cursame, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
