class Library < ActiveRecord::Base
  has_many :library_directories, as: :location, dependent: :destroy
  has_many :library_files, as: :location, dependent: :destroy
  has_many :libraries, as: :storable, dependent: :destroy

  belongs_to :storable, polymorphic: true
  belongs_to :network
end
