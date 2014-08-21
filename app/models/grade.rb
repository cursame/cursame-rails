class Grade < ActiveRecord::Base
  belongs_to :gradable, polymorphic: true, dependent: :destroy
  belongs_to :user
  validates_associated :user
  validates :gradable, presence: true
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

end
