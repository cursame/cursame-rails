class Library < ActiveRecord::Base
  belongs_to :storable, polymorphic: true
  belongs_to :network
end
