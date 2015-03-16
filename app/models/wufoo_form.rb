class WufooForm < ActiveRecord::Base
  has_many :wufoo_responses, dependent: :destroy
  has_many :wufoo_form_roles, dependent: :destroy
  has_many :roles, through: :wufoo_form_roles

  has_one :wall, as: :publication, dependent: :destroy
  
  belongs_to :showable, polymorphic: true
  belongs_to :user
  
  attr_accessible :identifier, :init_date, :term_date, :role_ids

  acts_as_commentable
  acts_as_votable

  after_create do
    create_walls
    create_notifications
  end

  def form
    begin
      wufoo.form(identifier)
    rescue Errors::MissingWufooSettingsError, SocketError
      nil
    end
  end

  def for_user?(user)
    case user.role
    when Role::TEACHER
      for_teachers?
    when Role::STUDENT
      for_students?
    when Role::ADMIN, Role::SUPERADMIN
      true
    else
      false
    end
  end

  def entry_for?(user)
    WufooResponse.exists?(wufoo_form_id: self, user_id: user)
  end

  def for_teachers?
    roles.include? Role::TEACHER
  end

  def for_students?
    roles.include? Role::STUDENT
  end

  private
  def create_walls
    Wall.create publication: self, network: network, courses: course, users: users
  end

  def create_notifications
    Notification.create users: users, notificator: self, kind: notification_type
  end

  def notification_type
    case showable
    when Network
      "network_wufoo_form"
    when Course
      "course_wufoo_form"
    else
      "undefined"
    end
  end

  def network
    case showable
    when Course
      showable.network
    when Network
      showable
    end
  end

  def course
    case showable
    when Course
      [ showable ]
    else
      []
    end
  end

  def users
    showable.users.keep_if {|u| roles.include?(u.role)}
  end

  private
  def wufoo
    raise Errors::MissingWufooSettingsError unless network.wufoo_settings?
    WuParty.new network.wufoo_setting.subdomain, network.wufoo_setting.api_key
  end
end
