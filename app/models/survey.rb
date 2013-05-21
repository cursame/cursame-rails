class Survey < ActiveRecord::Base
 # attr_accessible  :title, :description, :starts_at, :ends_at, :schedule_id, :schedule_type, :user_id, :network_id, :course_id, :show

  has_many :questions, :dependent => :destroy
  has_many :surveyings, :dependent => :destroy
  has_many :courses, :through => :surveyings
 # has_many :compart_assets, :dependent => :destroy
  # has_many :assets, :through => :compart_assets
  has_many :events, as: :schedule, :dependent => :destroy
  belongs_to :network
  belongs_to :poll
  has_many :user_surveys, :dependent => :destroy

  belongs_to :user
  has_many :activities, as: :activitye, :dependent => :destroy

  #comentarios para las surveys
  has_many :comments, :dependent => :destroy

  acts_as_commentable
  #para los likes
  acts_as_votable


  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  state_machine :state, :initial => :unpublish do
    state :unpublish
    state :published
    event :publish do
      transition :to => :published, :from => :unpublish
    end
  end

  before_destroy do
    walls = Wall.where(:publication_type => "Survey", :publication_id => id)
    notifications = Notification.where(:notificator_type => "Survey", :notificator_id => id)
    walls.each do |wall|
      wall.destroy
    end
    notifications.each do |notification|
      notification.destroy
    end
  end

  before_create do
    self.publish_date ||= DateTime.now
  end

  after_create do

    if self.publish_date <= DateTime.now then
      #self.update_attributes(:publish => true)
      self.publish!
    else
      #self.update_attributes(:publish => false)
    end

    Event.create(:title => self.name, :starts_at => self.publish_date, :ends_at => self.end_date,
          :schedule_id => self.id, :schedule_type => "Survey", :user_id => self.user_id,
          :course_id => self.course_ids, :network_id => self.network_id)
    users = []
    self.courses.each do |course|
      users+= course.users
      course.members_in_courses.each do |member|
        user = member.user
        if self.user_id != user.id then
          Notification.create :user => user, :notificator => self, :kind => 'new_survey_on_course'
        end
        #Notification.create :user => user, :notificator => self, :kind => 'new_survey_on_course', :course_id => course.id
      end
    end
    Wall.create!(:publication => self, :network => self.network, :courses => self.courses, :users => self.courses.first.users)
    #
    # Cuando se crea el survey, se le notifica a aca miembro de los cursos que tiene el survey
    #
    users =[]
    self.courses.each do |course|
      users+= course.users
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

  def title
     self.name
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
    user_surveys = self.user_surveys
    size = user_surveys.size
    average = 0.0
    user_surveys.each do
      |user_survey|
      average += user_survey.result
    end
    return average/size
  end

end
