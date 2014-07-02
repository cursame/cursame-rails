class Evaluation < ActiveRecord::Base

  belongs_to :qualifying, polymorphic: true

  validates :qualifying, presence: true
  validates :score, presence: true, numericality: { only_integer: true,
                                                    greater_than_or_equal_to: 0,
                                                    less_than_or_equal_to: 100 } 
  
end
