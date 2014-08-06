class Delivery < ActiveRecord::Base

  attr_accessible :description, :title, :create, :update, :edit, :network_id, :user_id, :end_date, :publish_date, :porcent_of_evaluation,
    :assets_attributes, :course_ids, :network_id, :deliveries_courses, :courses,:contents, :contents_attributes, :expired?

  attr_accessible :evaluation_criteria

  scope :active_inactive
  scope :courses
  scope :contents

  belongs_to :user

  has_many :deliveries_courses, :dependent => :destroy
  has_many :courses, :through => :deliveries_courses
  has_many :assignments, :dependent => :destroy
  has_many :delivery_assets, :dependent => :destroy
  has_many :assets, :through => :delivery_assets
  has_many :events, as: :schedule, :dependent => :destroy
  has_many :activities, as: :activitye
  has_many :contents, :as => :contentye
  has_many :evaluation_criteria, as: :evaluable, dependent: :destroy

  belongs_to :network
  belongs_to :wall

  validate :max_courses

  accepts_nested_attributes_for :evaluation_criteria
  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :contents

  validates_presence_of :end_date
  validates_presence_of :publish_date
  validates_presence_of :porcent_of_evaluation
  validates_presence_of :title
  validates_presence_of :courses
  validates_presence_of :user

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

    Event.create(:title => self.title, :description => self.description, :starts_at => self.publish_date,
                 :ends_at => self.end_date, :schedule_id => self.id, :schedule_type => "Delivery", :user_id => self.user_id,
                 :course_id => self.course_ids, :network_id => self.network_id)

    users = self.users

    Wall.create! :users => users, :publication => self, :network => self.network, :courses => self.courses

    users = []

    self.courses.each do |course|
      course.members_in_courses.each do |member|
        user = member.user
        if user.id != self.user_id && member.accepted == true then
          users.push(user)
        end
      end
    end

    self.send_mail(users)
    Notification.create(:users => users, :notificator => self, :kind => 'new_delivery_on_course')

    network_name = Network.find_by_id(self.network_id).name.capitalize

    begin
      self.courses.each do |course|
        mixpanel_properties = {
          'Network' => network_name,
          'Course'  => course.title.capitalize
        }
        MixpanelTrackerWorker.perform_async self.user_id, 'Deliveries', mixpanel_properties
      end
    rescue
      puts "\e[1;31m[ERROR]\e[0m error sending data to mixpanel"
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
    if role == "admin" || role == "superadmin" then
      return true
    end
    return user_id == user.id
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

end
