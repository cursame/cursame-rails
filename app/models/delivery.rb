class Delivery < ActiveRecord::Base
  attr_accessible :description, :title, :create, :update, :edit, :network_id, :user_id, :end_date, :publish_date, :porcent_of_evaluation,
 :assets_attributes, :course_ids, :network_id, :areas_of_evaluations_attributes, :deliveries_courses, :courses, :areas_of_evaluations,
 :areas_of_evaluation

  scope :active_inactive
  scope :courses
  has_many :deliveries_courses, :dependent => :destroy
  has_many :courses, :through => :deliveries_courses
  has_many :areas_of_evaluation, :dependent => :destroy
  has_many :areas_of_evaluations, :dependent => :destroy
  has_many :assignments, :dependent => :destroy
  belongs_to :user
  has_many :delivery_assets, :dependent => :destroy
  has_many :assets, :through => :delivery_assets
  has_many :events, as: :schedule, :dependent => :destroy
  has_many :activities, as: :activitye#, :dependent => :destroy
  belongs_to :network


  validate :max_courses

  # attr_accessible :dk_assets,  :title, :porcent_of_evaluation, :description, :publish_date, :end_date, :assets_attributes, :course_ids,  :file, :encryption_code_to_access, :user_id

  accepts_nested_attributes_for :areas_of_evaluations
  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :assignments

  validates_presence_of :end_date
  validates_presence_of :publish_date
  validates_presence_of :porcent_of_evaluation
  validates_presence_of :title

  acts_as_commentable
  #para los likes
  acts_as_votable

  #autoconversion de links, links inteligentes
  auto_html_for :description do
    html_escape
    image
    # This is defined in config/initializers/auto_html.rb
    dailymotion :width => "100%", :height => 250
    #flickr :width => 400, :height => 250
    google_map :width => "100%", :height => 250
    google_video :width => "100%", :height => 250
    metacafe :width => "100%", :height => 250
    soundcloud :width => "100%", :height => 250
    twitter :width => "100%", :height => 250
    vimeo :width => "100%", :height => 250
    youtube_js_api :width => "100%", :height => 250
    slideshare_support :width => "100%"
    ustream_support :width => "100%"
    prezi_with_wmode :width => "100%", :height => 360
    livestrem_support :width => "100%", :height => 360
    link :target => "_blank", :rel => "nofollow"
    redcarpet
    #sanitize
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
    wrap_notification = WrapNotification.new("Delivery",self.id)

    wrap_notification.delay.destroy_notifications

  end

  after_create do
    if self.publish_date <= DateTime.now
      self.publish!
    end

    Event.create(:title => self.title, :description => self.description, :starts_at => self.publish_date,
          :ends_at => self.end_date, :schedule_id => self.id, :schedule_type => "Delivery", :user_id => self.user_id,
          :course_id => self.course_ids, :network_id => self.network_id)

    users = self.users

    Wall.create(:users => users, :publication => self, :network => self.network, :courses => self.courses)

    self.delay.create_notifications
  end

  def create_notifications
    #Aqui se crean las notificaciones y los posts del wall :)
    self.courses.each do |course|
      course.members_in_courses.each do |member|
        user = member.user
        if user.id != self.user_id
          Notification.create(:user => user, :notificator => self, :kind => 'new_delivery_on_course')
          #se envia mail a cada uno de los miembros de curso
          mail = Notifier.new_delivery_notification(member,self)
          mail.deliver
        end
      end
    end
  end

  handle_asynchronously :create_notifications, :priority => 20, :run_at => Proc.new{ Time.zone.now}

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
    end_date < DateTime.now
  end

  def self.publish_new_deliveries
    Delivery.created.each do |delivery|
      if delivery.publish_date <= DateTime.now
        delivery.publish!
      end
    end
  end


  def max_courses
    errors.add(:courses, "Solamente puede tener un curso asociado al delivery.") if courses.length >= 2
  end


  def owner?(role,user)
    if role == "admin" || role == "superadmin" then
      return true
    end
    return user_id == user.id
  end

  #
  # Metodos para el analitics
  #

  def averageCalification
    assignments = self.assignments
    size = assignments.size
    average = 0.0
    assignments.each do
      |assignment|
      average += assignment.accomplishment
    end
    return average/size
  end
end
