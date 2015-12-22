class LibraryFile < ActiveRecord::Base
  belongs_to :location, polymorphic: true
  belongs_to :user

  mount_uploader :file, LibraryFileUploader

  after_create do
    create_notification
  end

  def library
    case location
    when Library
      location
    when Directory
      location.library
    end
  end

  def owner
    self.user
  end

  private
  def create_notification
    case location
    when Network, Library
      create_notification_for_network
    when Course
      create_notification_for_course
    end
  end

  def create_notification_for_course
    Notification.create users: library.storable.users, notificator: self, kind: 'new_library_file'
  end

  def create_notification_for_network
    Notification.create users: library.network.users, notificator: self, kind: 'new_library_file'
  end
end
