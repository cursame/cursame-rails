class LibraryFile < ActiveRecord::Base
  belongs_to :library
  attr_accessible :file
end
