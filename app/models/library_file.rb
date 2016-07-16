class LibraryFile < ActiveRecord::Base
  belongs_to :location, polymorphic: true
  belongs_to :user

  mount_uploader :file, LibraryFileUploader

  after_create do
    create_notification unless library.storable_type == 'User'
  end

  def library
    case location
    when Library
      location
    when LibraryDirectory
      location.library
    end
  end

  def owner
    self.user
  end

  private
  def create_notification
    Notification.create users: library.storable.users, notificator: self, kind: 'new_library_file'
  end
end
