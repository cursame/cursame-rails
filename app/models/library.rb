class Library < ActiveRecord::Base
  belongs_to :storable, polymorphic: true
  belongs_to :network
  has_many :files, class_name: 'LibraryFile', foreign_key: 'library_id', dependent: :destroy
  has_many :libraries, as: :storable, dependent: :destroy
end
