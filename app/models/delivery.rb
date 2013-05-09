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

  before_destroy do
    walls = Wall.where(:publication_type => "Delivery", :publication_id => id)
    notifications = Notification.where(:notificator_type => "Delivery", :notificator_id => id)
    walls.each do |wall|
      wall.destroy
    end
    notifications.each do |notification|
      notification.destroy
    end
  end

  after_create do
    if self.publish_date <= DateTime.now
      self.publish!
    end

      #### crear notificaciones
       puts "se ha creado una nueva tarea"
       #### se genera  el evento en el calendario
        Event.create :title => self.title, :description => self.description, :starts_at => self.publish_date, :ends_at => self.end_date, :schedule_id => self.id, :schedule_type => "Delivery", :user_id => self.user_id, :course_id => self.course_ids, :network_id => self.network_id


        # Wall.create :user => user, :publication => self, :network => course.network, :course_id => course.id

        #Aqui se crean las notificaciones y los posts del wall :)
        users =[]
        self.courses.each do |course|
          users+= course.users
          course.members_in_courses.each do |u|
            user = User.find_by_id(u.user_id)
            if u.owner != true && (user != nil)
              Notification.create :user => user, :notificator => self, :kind => 'new_delivery_on_course'
              #se envia mail a cada uno de los miembros de curso
              mail = Notifier.new_delivery_notification(u,self)
              mail.deliver
            end
          end
        end
        #validar que no exista doble publicacion para un usuario
        Wall.create :users => users, :publication => self, :network => self.network, :courses => self.courses
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


end
