class LibraryFile < ActiveRecord::Base
  has_one :wall, as: :publication, dependent: :destroy
  belongs_to :library
  belongs_to :user

  mount_uploader :file, LibraryFileUploader
  acts_as_commentable
  acts_as_votable

  after_create do
    create_wall
    create_notification
  end

  private
  def create_wall
    case library.storable
    when Network, Library
      create_wall_for_network
    when Course
      create_wall_for_course
    end
  end

  def create_notification
    case library.storable
    when Network, Library
      create_notification_for_network
    when Course
      create_notification_for_course
    end
  end

  def create_wall_for_network
    Wall.create publication: self, network: library.network, users: library.network.users
  end

  def create_wall_for_course
    Wall.create publication: self, network: library.network, courses: [ library.storable ], users: library.storable.users
  end

  def create_notification_for_course
    Notification.create users: library.storable.users, notificator: self, kind: 'new_library_file'
  end

  def create_notification_for_network
    Notification.create users: library.network.users, notificator: self, kind: 'new_library_file'
  end
end
