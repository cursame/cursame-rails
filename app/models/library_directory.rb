class LibraryDirectory < ActiveRecord::Base
  has_many :Library_directories, as: :location, dependent: :destroy
  has_many :library_files, as: :location, dependent: :destroy

  belongs_to :location, polymorphic: true
  attr_accessible :location_id, :location_type
end
