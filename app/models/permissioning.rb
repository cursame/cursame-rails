class Permissioning < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :network
  validates_associated :user
  validates_associated :role
  validates_associated :network
end