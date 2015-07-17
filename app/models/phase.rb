class Phase < ActiveRecord::Base
  attr_accessible :name, :order

  validates_presence_of :name
  validates_presence_of :order

end
