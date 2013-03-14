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

  # attr_accessible :dk_assets,  :title, :porcent_of_evaluation, :description, :publish_date, :end_date, :assets_attributes, :course_ids,  :file, :encryption_code_to_access, :user_id

  accepts_nested_attributes_for :areas_of_evaluations
  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :assignments, :assets

  acts_as_commentable


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
    #### se genera  el evento en el calendario
    Event.create :title => self.title, :description => self.description, :starts_at => self.publish_date, :ends_at => self.end_date, :schedule_id => self.id, :schedule_type => "Delivery", :user_id => self.user_id, :course_id => self.course_ids, :network_id => self.network_id
    #Aqui se crean las notificaciones y los posts del wall :)
    self.courses.each do |course|
      course.members_in_courses.each do |u|
        user = User.find_by_id(u.user_id)
        if u.owner != true
          Notification.create :user => user, :notificator => self, :kind => 'new_delivery_on_course'
        end
        Wall.create :user => user, :publication => self, :network => course.network
      end
    end
    #
    #Cuando una tarea se crea, tambien manda notificaciones a cada
    # miembro del curso al cual pertenece la tarea.
    self.courses.each do |course|
      course.members_in_courses.each do |member|
        mail = Notifier.new_delivery_notification(member,self)
        mail.deliver
      end
<<<<<<< HEAD
      
      after_create do
         if self.publish_date <= DateTime.now
            self.publish!
         end
        #### se genera  el evento en el calendario
        Event.create :title => self.title, :description => self.description, :starts_at => self.publish_date, :ends_at => self.end_date, :schedule_id => self.id, :schedule_type => "Delivery", :user_id => self.user_id, :course_id => self.course_ids, :network_id => self.network_id      
        
        #Aqui se crean las notificaciones y los posts del wall :)
        self.courses.each do |course|
          course.members_in_courses.each do |u|
            user = User.find_by_id(u.user_id)
            if u.owner != true
              Notification.create :user => user, :notificator => self, :kind => 'new_delivery_on_course', :course_id => course.id          
            end
            #validar que no exista doble publicacion para un usuario
            if (!Wall.find_by_user_id_and_publication_type_and_publication_id(user.id,'Delivery',self.id))
              Wall.create :user => user, :publication => self, :network => course.network, :course_id => course.id  
            end
            
          end
        end
       end      
       
       after_update do
         #### crear notificaciones
         puts "se ha creado una nueva tarea"
       end
       
       def expired?
         end_date < DateTime.now
       end
       
       def self.publish_new_deliveries
          Assignment.created.each do |assignment|
            if delivery.publish_date <= DateTime.now
              delivery.publish!
            end
          end
        end
        
  
=======
    end
  end
>>>>>>> e5c9cb108e921d391f8d90efb2f504426035e44b

  after_update do
    #### crear notificaciones
    puts "se ha creado una nueva tarea"
  end

  def expired?
    end_date < DateTime.now
  end

  def self.publish_new_deliveries
    Assignment.created.each do |assignment|
      if delivery.publish_date <= DateTime.now
        delivery.publish!
      end
    end
  end
end
