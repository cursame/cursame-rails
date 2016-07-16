class Delivery < ActiveRecord::Base
  attr_accessible :description, :title, :create, :update, :edit, :network_id,
                  :user_id, :end_date, :publish_date, :assets_attributes, :course_ids,
                  :network_id, :deliveries_courses, :courses,:contents, :contents_attributes,
                  :expired?, :evaluation_criteria_attributes, :evaluation_period,
                  :evaluation_period_id, :final_grade

  scope :active_inactive
  scope :courses
  scope :contents

  belongs_to :user
  belongs_to :evaluation_period

  has_many :deliveries_courses, :dependent => :destroy
  has_many :courses, :through => :deliveries_courses
  has_many :assignments, :dependent => :destroy
  has_many :delivery_assets, :dependent => :destroy
  has_many :assets, :through => :delivery_assets
  has_many :events, as: :schedule, :dependent => :destroy
  has_many :activities, as: :activitye
  has_many :contents, :as => :contentye
  has_many :evaluation_criteria, as: :evaluable, dependent: :destroy
  has_many :reported_contents, as: :reportable, dependent: :destroy

  belongs_to :network
  belongs_to :wall

  validate :max_courses

  accepts_nested_attributes_for :evaluation_criteria, allow_destroy: true
  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :contents

  validates_presence_of :publish_date
  validates_presence_of :title
  validates_presence_of :courses
  validates_presence_of :user

  validates_presence_of :evaluation_period, :unless => lambda { self.courses.first.evaluation_periods.empty? }

  acts_as_commentable
  acts_as_votable

  # autoconversion de links, links inteligentes
  # this is defined in config/initializers/auto_html.rb
  auto_html_for :description do
    html_escape
    image
    dailymotion  :width => "100%", :height => 250
    google_map   :width => "100%", :height => 250
    google_video :width => "100%", :height => 250
    metacafe     :width => "100%", :height => 250
    soundcloud   :width => "100%", :height => 250
    twitter      :width => "100%", :height => 250
    vimeo        :width => "100%", :height => 250
    youtube      :width => "100%", :height => 250
    slideshare_support :width => "100%"
    ustream_support    :width => "100%"
    prezi_with_wmode   :width => "100%", :height => 360
    livestrem_support  :width => "100%", :height => 360
    link :target => "_blank", :rel => "nofollow"
    redcarpet
    simple_format
  end

  state_machine :state, :initial => :unpublish do
    state :unpublish
    state :published
    event :publish do
      transition :to => :published, :from => :unpublish
    end
  end

  before_create do
    self.publish_date ||= DateTime.now
  end

  after_destroy do
    walls = Wall.where(:publication_type => "Delivery", :publication_id => id)
    walls.each do |wall|
      wall.destroy
    end

    notifications = Notification.where(:notificator_type => "Delivery", :notificator_id => self.id)

    notifications.each do |notification|
      notification.destroy
    end

  end

  after_create do
    if self.publish_date <= DateTime.now
      self.publish!
    end

    Wall.create! :users => self.users, :publication => self, :network => self.network, :courses => self.courses
    Event.create title: self.title, starts_at: self.publish_date, ends_at: self.end_date, schedule_id: self.id, schedule_type: "Delivery", network_id: self.network_id

    if self.publish_date > DateTime.now
      ScheduledJob::NotificationsWorker.perform_at(self.publish_date, self.id, self.class.name, 'new_delivery_on_course')
      ScheduledJob::SendMailsWorker.perform_at(self.publish_date, self.id, self.class.name)
    else
      Notification.create(users: self.accepted_users, notificator: self, kind: 'new_delivery_on_course')
      self.send_mail(self.accepted_users)
    end
  end

  after_update do

  end

  def users
    users = []
    courses.each do |course|
      users = users.concat(course.users)
    end
    return users
  end

  def accepted_users
    users = []
    self.courses.each do |course|
      course.members_in_courses.each do |member|
        user = member.user
        users.push(user) if user.id != self.user_id && member.accepted?
      end
    end
    return users
  end

  def expired?
    @expired_in  = self.end_date

    if @expired_in <= DateTime.now
      @expired = true
    else
      @expired = false
    end

    if  @expired == true
      self.state = 'unpublish'
      self.save!
    end
  end

  def self.publish_new_deliveries
    Delivery.created.each do |delivery|
      if delivery.publish_date <= DateTime.now
        if delivery.end_date >= DateTime.now
          delivery.publish!
        end
      end
    end
  end

  def max_courses
    errors.add(:courses, "Solamente puede tener un curso asociado al delivery.") if courses.length >= 2
  end

  def owner?(role, user)
    if role == "admin" || role == "superadmin" || role == "operator"
      return true
    end
    return (user_id == user.id or self.courses.first.owner?(role,user))
  end

  def send_mail(users)
    Thread.new {
      begin
        mail = Notifier.new_delivery_notification(users,self)
        mail.deliver
      rescue => ex
      ensure
        ActiveRecord::Base.connection.close
      end
    }
  end

  def responses
    assignments
  end

  def deadline
    if end_date.nil?
      I18n.t('delivery.nil_end_date')
    else
      "#{I18n.t('delivery.deadline')} #{I18n.l(end_date, format: :short)}"
    end
  end
end
