class LibraryFile < ActiveRecord::Base
  belongs_to :library
  mount_uploader :file, LibraryFileUploader
end
