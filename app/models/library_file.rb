class LibraryFile < ActiveRecord::Base
  has_one :wall, as: :publication, dependent: :destroy
  
  belongs_to :location, polymorphic: true
  belongs_to :user

  mount_uploader :file, LibraryFileUploader
  acts_as_commentable
  acts_as_votable

  after_create do
    create_wall
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

  private
  def create_wall
    case location.storable
    when Network, Library
      create_wall_for_network
    when Course
      create_wall_for_course
    end
  end

  def create_notification
    case location.storable
    when Network, Library
      create_notification_for_network
    when Course
      create_notification_for_course
    end
  end

  def create_wall_for_network
    Wall.create publication: self, network: location.network, users: location.network.users
  end

  def create_wall_for_course
    Wall.create publication: self, network: location.network, courses: [ location.storable ], users: location.storable.users
  end

  def create_notification_for_course
    Notification.create users: location.storable.users, notificator: self, kind: 'new_library_file'
  end

  def create_notification_for_network
    Notification.create users: location.network.users, notificator: self, kind: 'new_library_file'
  end
end