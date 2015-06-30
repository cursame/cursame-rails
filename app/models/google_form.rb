class GoogleForm < ActiveRecord::Base
  belongs_to :pollable, polymorphic: true
  belongs_to :user

  has_many :google_form_roles, dependent: :destroy
  has_many :roles, through: :google_form_roles

  has_one :wall, as: :publication, dependent: :destroy

  attr_accessible :title, :description, :init_date, :term_date, :url, :role_ids

  acts_as_commentable
  acts_as_votable

  after_create do
    create_walls
    if self.init_date > DateTime.now
      ScheduledJob::NotificationsWorker.perform_at(self.init_date, self.id, self.class.name, notification_type)
    else
      create_notifications
    end
  end

  def for_teachers?
    roles.include? Role::TEACHER
  end

  def for_students?
    roles.include? Role::STUDENT
  end

  def for_user?(user)
    case user.role
    when Role::TEACHER
      for_teachers?
    when Role::STUDENT
      for_students?
    when Role::ADMIN, Role::SUPERADMIN, Role::OPERATOR
      true
    else
      false
    end
  end

  def users
    pollable.users.keep_if { |user| roles.include?(user.role) }
  end

  private
  def create_walls
    Wall.create publication: self, network: network, courses: course, users: users
  end

  def create_notifications
    Notification.create users: users, notificator: self, kind: notification_type
  end

  def network
    case pollable
    when Course
      pollable.network
    when Network
      pollable
    end
  end

  def course
    case pollable
    when Course
      [ pollable ]
    else
      []
    end
  end

  def notification_type
    case pollable
    when Network
      "network_google_form"
    when Course
      "course_google_form"
    else
      "undefined"
    end
  end
end
