class Grade < ActiveRecord::Base
  belongs_to :gradable, polymorphic: true
  belongs_to :user
  validates_associated :user
  validates :gradable, presence: true
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  def score
  	read_attribute(:score).nil? ? nil : ("%.2g" % (read_attribute(:score) / 10.0))
  end

  def score=(value)
    puts (value.to_i * 10)
    write_attribute(:score, value.to_i * 10)
  end
end
