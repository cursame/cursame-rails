class Survey < ActiveRecord::Base
 # attr_accessible  :title, :description, :starts_at, :ends_at, :schedule_id, :schedule_type, :user_id, :network_id, :course_id, :show

  has_many :questions, :dependent => :destroy
  has_many :surveyings
  has_many :courses, :through => :surveyings
  has_many :compart_assets
  has_many :assets, :through => :compart_assets
  has_many :events, as: :schedule
  belongs_to :network
  belongs_to :poll
  has_many :user_surveys

  belongs_to :user
  has_many :activities, as: :activitye

  #comentarios para las surveys
  has_many :comments
  acts_as_commentable

  
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
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
    
    Event.create :title => self.name, :starts_at => self.publish_date, :ends_at => self.end_date, :schedule_id => self.id, :schedule_type => "Survey", :user_id => self.user_id, :course_id => self.course_ids, :network_id => self.network_id
    self.courses.each do |course|
    
    User.all.each do |u|
      Notification.create :user => u, :notificator => self, :kind => 'new_survey_on_course'
      if (!Wall.find_by_user_id_and_publication_type_and_publication_id(user.id,'Survey',self.id))
      
        Wall.create :user => u, :publication => self, :network => self.network, :course_id => course.id
      
      end
    end
    
    end

    #
    # Cuando se crea el survey, se le notifica a caca miembro de los cursos que tiene el survey
    #
    self.courses.each do |course|
      course.members_in_courses.each do |member|
        mail = Notifier.new_survey_notification(member,self)
        mail.deliver
      end
    end
  end
  
  def expired?
     end_date < DateTime.now
   end
   
   def self.publish_new_surveys
     Survey.unpublished.each do |survey|
       if survey.start_at <= DateTime.now
         survey.publish!
       end
     end
   end
  
  def self.user
    User.last
  end

end
