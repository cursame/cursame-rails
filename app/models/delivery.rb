class Delivery < ActiveRecord::Base
  attr_accessible :description, :title, :create, :update, :edit, :network_id, :user_id, :end_date, :publish_date, :porcent_of_evaluation, :assets_attributes, :course_ids, :network_id, :areas_of_evaluations_attributes, :deliveries_courses, :courses

  scope :active_inactive
  scope :courses
  has_many :deliveries_courses
  has_many :courses, :through => :deliveries_courses, :dependent => :destroy
  has_many :areas_of_evaluation
  has_many :assignments
  has_many :areas_of_evaluations, :dependent => :destroy
  belongs_to :user
  has_many :delivery_assets, :dependent => :destroy
  has_many :assets, :through => :delivery_assets
  has_many :events, as: :schedule
  has_many :activities, as: :activitye
  belongs_to :network


  validate :max_courses

  # attr_accessible :dk_assets,  :title, :porcent_of_evaluation, :description, :publish_date, :end_date, :assets_attributes, :course_ids,  :file, :encryption_code_to_access, :user_id

  accepts_nested_attributes_for :areas_of_evaluations
  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :assignments, :assets

  validate :validate_unique_course

  def validate_tags
    errors.add(:courses, "too much") if courses.length > 1
  end

  acts_as_commentable
  #para los likes
  acts_as_votable

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
            if u.owner != true
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


end
