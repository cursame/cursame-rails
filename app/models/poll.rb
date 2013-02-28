class Poll < ActiveRecord::Base
  has_many :surveys, :dependent => :destroy
  accepts_nested_attributes_for :surveys 
end
