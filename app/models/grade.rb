class Grade < ActiveRecord::Base
  belongs_to :gradable, polymorphic: true
  belongs_to :user

  validates_associated :user
  
  validates :gradable, presence: true
  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

end
